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
  });
}
