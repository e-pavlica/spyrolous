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
  // intercept clicks to set drawType to circle
  $("#circle").click(function(){
    drawType = "circle";
  });
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
  if(drawType == "circle") {
    // define the data to post to the circles model
    var posX = $(e.target).offset().left;
    var posY = $(e.target).offset().top;
    var x = e.pageX - posX;
    var y = e.pageY - posY;
    var data = {circle:{x: x, y: y, radius: 50}};
    postCircle(data);

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


