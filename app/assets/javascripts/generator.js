// generate the svg path for a spyrograph

function generateSpyro(xOffset, yOffset, bigRadius, smallRadius, rho) {
  // setup variables
  var r1, r2, path, t, x1, x2, firstRun;
  path = '';
  r1 = bigRadius;
  r2 = smallRadius;
  t = 0.0;
  firstRun = true;

  //for testing
  // var points = 1;

  while (t < 13 * Math.PI) {
    // generate the x, y coords
    var x = ((r1 - r2) * Math.cos(t) + rho * Math.cos((r1 - r2) * t / r2)) + xOffset;
    var y = ((r1 - r2) * Math.sin(t) - rho * Math.sin((r1 - r2) * t / r2)) + yOffset;
    // If the first pair of x, y coords, make them the MoveTo
    if (firstRun) {
      path += 'M' + Math.round(x * 10000) / 10000 + ' ' + Math.round(y * 10000) / 10000;
      firstRun = false;
      x1 = x;
      y1 = y;
    }
    // break the loop if the full circle is complete
    else if (x == r1 - rho + xOffset && y == yOffset) {
      // console.log(points);
      return path;
      break;
    }
    // add x,y coords to the path
    else {
      path += 'L' + Math.round(x * 10000) / 10000 + ' ' + Math.round(y * 10000) / 10000;
      points += 1;
    }
    t += 0.002;
  }
  // console.log(points);
  return path;
}
