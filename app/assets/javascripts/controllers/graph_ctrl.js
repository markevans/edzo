function GraphCtrl($scope, people) {
  people.query(function (data) {
    $scope.people = data
  })
}
