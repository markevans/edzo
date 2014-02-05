function graphCtrl($scope, people, relationships, positioner) {

  people.all(function (peeps) {
    $scope.people = peeps
    $scope.nodes = peeps.map(function (p, i) {
      return {
        person: p,
        position: positioner(i)
      }
    })
  })

  relationships.all(function (rels) {
    $scope.relationships = rels
  })
}
