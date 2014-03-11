function maxNodePosition () {
  return function (nodes) {
    var maxPosition = {x: 0, y: 0}
    nodes.forEach(function (node) {
      if (node.position.x > maxPosition.x) { maxPosition.x = node.position.x }
      if (node.position.y > maxPosition.y) { maxPosition.y = node.position.y }
    })
    return maxPosition
  }
}
