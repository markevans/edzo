function positioner () {
  var perRow = 5,
      pxSpacing = 150
  return function (i) {
    return {
      x: (i % perRow) * pxSpacing,
      y: Math.floor(i / perRow) * pxSpacing
    }
  }
}
