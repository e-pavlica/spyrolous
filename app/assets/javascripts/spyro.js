// define a variable that will hold the active layer id
var layer_id;

// define a variable to tell draw function what to do
var drawType;

function initialize() {

  // intercept clicks on layer thumbnails to set the active layer
  $('.layerThumb').bind('click', setLayerId);

  // Update layer attributes when the layer update button is clicked.
  $('#layerUpdateBtn').bind('click', layerUpdate);

  // draw a new object on the canvas.
  $('#snapContainer').click(draw);

  // set drawType to circle
  $('#circle').click(function() {
    drawType = 'circle';
    selectTypeBtn($(this));
    $('.options').hide();
    $('#circleOptions').show();
  });

  // set drawType to rectangle
  $('#rectangle').click(function() {
    drawType = 'rectangle';
    selectTypeBtn($(this));
    $('.options').hide();
    $('#rectOptions').show();
  });

  // setDrawType to spyro
  $('#spyro').click(function() {
    drawType = 'spyro';
    selectTypeBtn($(this));
    $('.options').hide();
    $('#spyroOptions').show();
  });

  // Set the default layer_id to the first layer.
  layer_id = $('.layerThumb').first().attr('layer_id');
  $('.layerThumb').first().css('background', 'rgba(190,60,60,0.7');

  //Add a new layer to the canvas
  $('#newLayerBtn').click(function() {
    $.post('/canvases/' + canvas_id + '/layers/',
      null,
      function(response) {
        $('.layerContainer').append('<div class="layerThumb" layer_id="' + response.id + '"></div>');
      });
  });

  // Initialize the color picker.
  $('#fillPicker').spectrum({
    color: '#000',
    allowEmpty: true
  });
  $('#strokePicker').spectrum({
    color: '#000',
    allowEmpty: true
  });

  deleteCircle();
  deleteRect();
  deleteSpyro();

}


// set the active layer
function setLayerId(e) {
  layer_id = $(e.target).attr('layer_id');
  $('#snapContainer svg').css('z-index', '0');
  $('#l' + $(e.target).attr('layer_id')).css('z-index', '1');
  changeColor(e);
}

// change the color of the active layer
function changeColor(e) {
  // clear color off of the previous active layer
  $('.layerThumb').css('background', 'white');
  // change the background color of the new active div
  $(e.target).css('background', 'rgba(190,60,60,0.7');
}


function draw(e) {
  // define the position of the element based on click event
  var posX = $(e.target).offset().left;
  var posY = $(e.target).offset().top;
  var x = e.pageX - posX;
  var y = e.pageY - posY;
  var data;

  if (drawType == 'circle') {
    // define the data to post to the circles model
    data = {circle: {x: x, y: y, radius: $('#circleRadius').val()}};
    postCircle(data);
  }

  if (drawType == 'rectangle') {
    //define the data to post to the rectangles model
    data = {rectangle: {
      x: x,
      y: y,
      width: $('#rectWidth').val(),
      height: $('#rectHeight').val()}
    };
    postRect(data);
  }

  if (drawType == 'spyro') {
    // define the data to post for a new spyro path
    console.log('making a new spyro');
    var generatedPath = generateSpyro(
      x,
      y,
      $('#spyroRadiusLarge').val(),
      $('#spyroRadiusSmall').val(),
      $('#spyroRho').val()
    );
    data = {spyro: {path: generatedPath}};
    postSpyro(data);
  }
}

// post the circle to the database and draw it to the canvas
function postCircle(data) {
  $.post(
    '/canvases/' + canvas_id + '/layers/' + layer_id + '/circles',
    data,
    function(response) {
      // s.circle(response.x, response.y, response.radius);
  });
}

// post the rectangle to the database & draw it to the canvas
function postRect(data) {
  $.post(
    '/canvases/' + canvas_id + '/layers/' + layer_id + '/rectangles',
    data,
    function(response) {
      // var x = s.rect(response.x, response.y, response.width, response.height);
      // x.id = 'Rect' + response.id;
    }
  );
}

function postSpyro(data) {
  $.post(
    '/canvases/' + canvas_id + '/layers/' + layer_id + '/spyros',
    data,
    function(response) {
      // nothing to do here right now.
    }
  );
}

// delete a circle when it's clicked on
function deleteCircle() {
  $('circle').click(function() {
    $.ajax({
      type: 'DELETE',
      url: '/canvases/' + canvas_id + '/layers/' + $(this).attr('layer_id') + '/circles/' + $(this).attr('circle_id')
    });
    // $(this).remove();
  });
}

// delete a rectangle when it's clicked on
function deleteRect() {
  $('rect').click(function() {
    $.ajax({
      type: 'DELETE',
      url: '/canvases/' + canvas_id + '/layers/' + $(this).attr('layer_id') + '/rectangles/' + $(this).attr('rect_id')
    });
    // $(this).remove();
  });
}

function deleteSpyro() {
  $('path[spyro_id]').click(function() {
    $.ajax({
      type: 'DELETE',
      url: '/canvases/' + canvas_id + '/layers/' + $(this).attr('layer_id') + '/spyros/' + $(this).attr('spyro_id')
    });
  });
}


// Show which typeBtn is currently selected.
function selectTypeBtn(o) {
    $('.typeBtn').removeClass('selected');
    o.addClass('selected');
}

// Update a layer's attributes
function layerUpdate() {
  var fillChoice;
  function setfill() {
    if ($('#fillPicker').val() == '')
      fillChoice = 'none';
    else
      fillChoice = $('#fillPicker').val();
  };
  setfill();
  var newAttributes = {
    fill: fillChoice,
    stroke: $('#strokePicker').val()
  };
  postAttr(newAttributes);
  function postAttr(attr) {
    $.ajax({
      type: 'PATCH',
      url: '/canvases/' + canvas_id + '/layers/' + layer_id,
      data: {layer: attr},
      success: function(success) {
      }
    });
  }
}

function setupSliders() {
  $('#radiusSlider').slider({min: 0, max: 100, slide: function(e, ui) {
    $('#circleRadius').val() = ui.value;
  }});
  $('#rectHeightSlider').slider({min: 0, max: 100, slide: function(e, ui) {
    $('#rectHeight').val() = ui.value;
  }});
  $('#rectWidthSlider').slider({min: 0, max: 100, slide: function(e, ui) {
    $('#rectWidth').val() = ui.value;
  }});
  $('#spyroRadiusLrgSlider').slider({min: 0, max: 100, slide: function(e, ui) {
    $('#spyroRadiusLarge').val() = ui.value;
  }});
  $('#spyroRadiusSmlSlider').slider({min: 0, max: 100, slide: function(e, ui) {
    $('#spyroRadiusSmall').val() = ui.value;
  }});
  $('#spyroRhoSlider').slider({min: 0, max: 100, slide: function(e, ui) {
    $('#spyroRho').val() = ui.value;
  }});
}
