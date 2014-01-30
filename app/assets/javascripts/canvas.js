// Define a variable for SVG object attributes
var attributes = function(obj) {
  return {
    fill: obj.fill,
    stroke: obj.stroke,
    opacity: obj.opacity,
    strokeWidth: obj.stroke_width
  };
};


function subscribeToLayers(id) {
  var a, o;
  var source = new EventSource('/canvases/' + canvas_id + '/layers/' + id + '/stream');
  source.addEventListener('update', function(e) {
    var z = JSON.parse(e.data);
    var n = z.data;
    // console.log(n);

    if (n.data) {
      console.log(n.data);
    }

    if (n.circle) {
      o = n.circle;
      a = window['l' + id].circle(o.x, o.y, o.radius);
      a.node.id = 'circle' + o.id;
      a.attr(attributes(o));
      $('circle').last().attr('circle_id', o.id);
      $('circle').last().attr('layer_id', id);
      deleteCircle(a);
    }
    if (n.rectangle) {
      o = n.rectangle;
      a = window['l' + id].rect(o.x, o.y, o.width, o.height);
      a.attr(attributes(o));
      $('rect').last().attr('rect_id', o.id);
      $('rect').last().attr('layer_id', id);
      deleteRect(a);
    }
    if (n.spyro) {
      // $.get(
      //   '/canvases/' + canvas_id + '/layers/' + id + '/spyros/' + n.spyro,
      //   null,
      //   function(data) {
      //     a = window['l' + id].path(data.path);
      //     a.attr(attributes(data));
      //     $('path').last().attr('spyro_id', data.id);
      //     $('path').last().attr('layer_id', id);
      //     deleteSpyro(a);
      //   });
      o = n.spyro;
      var generatedPath = generateSpyro(o.x, o.y, o.big_radius, o.small_radius, o.rho);
      a = window['l' + id].path(generatedPath);
      a.attr(attributes(o));
      $('path').last().attr('spyro_id', o.id);
      $('path').last().attr('layer_id', id);
      deleteSpyro(a);
    }
    if (n.layer) {
      window['l' + id].attr({
        fill: n.layer.fill,
        stroke: n.layer.stroke,
        opacity: n.layer.opacity
      });
    }
    if (n.destroy) {
      var d = n.destroy;
      console.log(d);
      if (d.circle) {
        $('circle[circle_id =' + d.circle + ']').remove();
      }
      if (d.rectangle) {
        $('rect[rect_id =' + d.rectangle + ']').remove();
      }
      if (d.spyro) {
        $('path[spyro_id =' + d.spyro + ']').remove();
      }
    }
  });
}
