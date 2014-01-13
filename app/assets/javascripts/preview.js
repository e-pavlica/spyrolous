// scope the preview stuff into the Preview object so things don't get confused
function Preview() {
  var s, x, y, f, st, o, w;
}

// set up the preview pane.
Preview.prototype.create = function() {
  s = Snap('#preview');
  x = $('#preview').width() / 2;
  y = $('#preview').height() / 2;
};

// get the valuse from the color selectors
Preview.prototype.svgAttrs = function() {
  return {
  fill: $('#fillPicker').val(),
  stroke: $('#strokePicker').val(),
  opacity: 1,                       // need to add selector here when opacity is built
  strokeWidth: 1                    // need to add selector here when stroke width is built
  }
};

// prepare the preview pane for a new draw
Preview.prototype.prep = function() {
  if (typeof s == 'undefined') {this.create();}
  s.clear();
};

// draw a circle on the preview pane
Preview.prototype.circle = function() {
  var r = $('#circleRadius').val();
  this.prep();
  s.circle(x, y, r).attr(this.svgAttrs());
};

// draw a rect to the preview pane
Preview.prototype.rect = function() {
  var h = $('#rectHeight').val();
  var w = $('#rectWidth').val();
  this.prep();
  s.rect(x, y, w, h).attr(this.svgAttrs());
};

Preview.prototype.spyro = function() {
  var br = $('#spyroRadiusLarge').val();
  var sr = $('#spyroRadiusSmall').val();
  var rh = $('#spyroRho').val();
  this.prep();
  s.path(generateSpyro(x, y, br, sr, rh)).attr(this.svgAttrs());
}