
function subscribeToLayers(id) {
  // var s = 'l' + id;
  var a;
  var source = new EventSource('/canvases/' + canvas_id + '/layers/' + id + '/stream');
  source.addEventListener('update', function(e) {
    newData = JSON.parse(e.data);
    if (newData.circle) {
      a = window['l'+id].circle(newData.circle.x, newData.circle.y, newData.circle.radius);
      a.node.id = newData.circle.id;
    }
    if (newData.rect) {
      a = window['l'+id].rect(newData.rect.x, newData.rect.y, newData.rect.width, newData.rect.height);
      a.node.id = newData.rect.id;
    }
    if (newData.spyro) {
      $.get(
        '/canvases/' + canvas_id + '/layers/' + id + '/spyros/' + newData.spyro,
        null,
        function(data) {
          a = window['l'+id].path(data.path);
          a.node.id = data.id;
        });
    }
  });
}
