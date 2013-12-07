// define a variable that will hold the active layer id
var layer_id;

// define a variable to tell draw function what to do
var drawType;

// define a variable for the snap canvas
var s;

$(document).ready(function(){
  // intercept clicks on layer thumbnails to set the active layer
  $(".layerThumb").bind("click", setLayerId);
  // draw a new object on the canvas.
  $("#spyro").click(draw);
  // set drawType to circle
  $("#circle").click(function(){
    drawType = "circle";
  });
  // set drawType to rectangle
  $("#rectangle").click(function(){
    drawType = "rectangle";
  })

  // Setup the Snap canvas
  s = Snap("#canvas");



})

// set the active layer
function setLayerId(e){
  layer_id = $(e.target).attr("layer_id");
  changeColor(e);
}

// change the color of the active layer
function changeColor(e){
  $(e.target).css("background","rgba(190,60,60,0.7");
  // prob need a function here to clear color off of the previous active layer
}


function draw(e) {
  // define the position of the element based on click event
  var posX = $(e.target).offset().left;
  var posY = $(e.target).offset().top;
  var x = e.pageX - posX;
  var y = e.pageY - posY;
  
  if(drawType == "circle") {
    // define the data to post to the circles model
    var data = {circle:{x: x, y: y, radius: $("#circleRadius").val()}};
    postCircle(data);
  }
  if(drawType == "rectangle"){

    //define the data to post to the rectangles model
    var data = {rectangle:{x: x, y: y, width: $("#rectWidth").val(), height: $("#rectHeight").val()}};
    postRect(data);
  }
}

// post the circle to the database and draw it to the canvas
function postCircle(data){
  $.post(
    "/canvases/"+canvas_id+"/layers/"+layer_id+"/circles",
    data,
    function(response){
      s.circle(response.x, response.y, response.radius);
  });
}

// post the rectangle to the database & draw it to the canvas
function postRect(data){
  $.post(
    "/canvases/"+canvas_id+"/layers/"+layer_id+"/rectangles",
    data,
    function(response){
      var x = s.rect(response.x, response.y, response.width, response.height);
      x.id = "Rect"+response.id;
    }
  )
}

// delete a circle when it's clicked on
function deleteCircle(){
  $('circle').click(function(){
    $.ajax({
      type:"DELETE",
      url:"/canvases/"+canvas_id+"/layers/"+layer_id+"/circles/"+$(this).attr("id")
    });
    $(this).remove();
  });
}

// delete a rectangle when it's clicked on
function deleteRect(){
  $('rect').click(function(){
    $.ajax({
      type:"DELETE",
      url:"/canvases/"+canvas_id+"/layers/"+layer_id+"/rectangles/"+$(this).attr("id")
    });
    $(this).remove();
  });
}

// Change the color attributes of the snap layer
function colorButtons(){
  // !!!!!NEED TO SEND THESE ATTR TO THE DATABASE
  $("#fillRed").click(function(){
    s.attr({fill:"#FF0000"});
  });

  $("#fillBlue").click(function(){
    s.attr({fill:"#0000FF"});
  });

 $("#fillGreen").click(function(){
    s.attr({fill:"#00FF00"});
 });

  $("#strokeRed").click(function(){
    s.attr({stroke:"#FF0000"});
  });

  $("#strokeBlue").click(function(){
    s.attr({stroke:"#0000FF"});
  });

  $("#strokeGreen").click(function(){
    s.attr({stroke:"#00FF00"});
  });
}