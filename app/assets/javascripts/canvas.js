var socketTest;

function subscribeToLayers(id) {
  var source = new EventSource('/canvases/' + canvas_id + '/layers/' + id + '/stream');
  source.addEventListener('update', function(e) {
    // console.log(e.data);
    newData = JSON.parse(e.data);
    if (newData.circle) {
      var a = s.circle(newData.circle.x, newData.circle.y, newData.circle.radius);
      a.node.id = newData.circle.id;
    }
    if (newData.rect) {
      var a = s.rect(newData.rect.x, newData.rect.y, newData.rect.width, newData.rect.height);
      a.node.id = newData.rect.id;
    }
    if (newData.spyro) {
      var a = s.path(newData.spyro.path);
      a.node.id = newData.spyro.id;
    }
  });
}
