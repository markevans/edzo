function graphCtrl($scope, peopleAndRelationships, positioner) {
  $scope.nodes = []
  $scope.connections = []

  peopleAndRelationships.all(function (people, relationships) {
    $scope.people = people

    var nodeLookup = {}

    people.forEach(function (person, i) {
      var node = {
        person: person,
        position: positioner(i)
      }
      nodeLookup[person.id] = node
      $scope.nodes.push(node)
    })

    relationships.forEach(function (relationship) {
      $scope.connections.push({
        startNode: nodeLookup[relationship.person_1_id],
        endNode: nodeLookup[relationship.person_2_id]
      })
    })

  })

}
