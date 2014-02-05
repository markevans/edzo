function positioner () {
  var width = 5
  return function (i) {
    return {
      x: (i % width),
      y: Math.floor(i / width)
    }
  }
}
