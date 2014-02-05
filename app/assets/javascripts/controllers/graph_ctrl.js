function graphCtrl($scope, people, positioner) {
  people.all(function (peeps) {
    $scope.nodes = peeps.map(function (p, i) {
      return {
        person: p,
        position: positioner(i)
      }
    })
  })
}
