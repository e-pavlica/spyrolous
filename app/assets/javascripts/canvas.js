function subscribeToLayers(id) {
  var source = new EventSource('/canvases/' + canvas_id + '/layers/' + id + '/stream');
  source.addEventListener('update', function(e) {
    console.log(e);
  });
}
