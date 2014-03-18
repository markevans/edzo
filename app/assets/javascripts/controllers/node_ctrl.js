function nodeCtrl ($scope) {
  $scope.toggleView = function () {
    $scope.node.showPopup = !$scope.node.showPopup
  }
}
