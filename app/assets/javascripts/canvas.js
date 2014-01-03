
function subscribeToLayers(id) {
  var a;
  var source = new EventSource('/canvases/' + canvas_id + '/layers/' + id + '/stream');
  source.addEventListener('update', function(e) {
    newData = JSON.parse(e.data);
    // console.log(newData);

    if (newData.data) {
      console.log(newData.data);
    }

    if (newData.circle) {
      a = window['l' + id].circle(newData.circle.x, newData.circle.y, newData.circle.radius);
      a.node.id = 'circle' + newData.circle.id;
      $('circle').last().attr('circle_id', newData.circle.id);
      $('circle').last().attr('layer_id', id);
      initialize();
    }
    if (newData.rectangle) {
      a = window['l' + id].rect(newData.rectangle.x, newData.rectangle.y, newData.rectangle.width, newData.rectangle.height);
      $('rect').last().attr('rect_id', newData.rectangle.id);
      $('rect').last().attr('layer_id', id);
      initialize();
    }
    if (newData.spyro) {
      $.get(
        '/canvases/' + canvas_id + '/layers/' + id + '/spyros/' + newData.spyro,
        null,
        function(data) {
          window['l' + id].path(data.path);
          $('path').last().attr('spyro_id', data.id);
          $('path').last().attr('layer_id', id);
        });
      initialize();
    }
    if (newData.layer) {
      window['l' + id].attr({
        fill: newData.layer.fill,
        stroke: newData.layer.stroke,
        opacity: newData.layer.opacity
      });
    }
    if (newData.destroy) {
      var d = newData.destroy;
      if (d.circle) {
        $('circle[circle_id =' + d.circle + ']').remove();
      }
      if (d.rect) {
        $('rect[rect_id =' + d.rect + ']').remove();
      }
      if (d.spyro) {
        $('path[spyro_id =' + d.spyro + ']').remove();
      }
    }
  });
}
