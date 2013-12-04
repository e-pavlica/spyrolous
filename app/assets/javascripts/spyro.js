//for google apis client library
onLoadCallback = function() {
  window.setTimeout(startGameForReal, 1);
}

//draw on the #snap svg tag
$(document).ready(function(){
  // makes a new Snap object
  var s = Snap("#snap");

  // draws a circle wherever you click on the svg element
  $("#spyro").click(function(e){
    var posX = $(this).offset().left;
    var posY = $(this).offset().top;
    var x = e.pageX - posX;
    var y = e.pageY - posY;
    console.log(e);
    s.circle(x,y,50);
  })
})