$(document).ready(function(){
  //Draw a new Snap object
  var s = Snap("#snap");

  //let's just put a big ol' circle there for now.
  var circle = s.circle(100,100,50);

  $("#spyro").click(function(e){
    var posX = $(this).offset().left;
    var posY = $(this).offset().top;
    var x = e.pageX - posX;
    var y = e.pageY - posY;
    console.log(e);
    s.circle(x,y,50);
  })
})