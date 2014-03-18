function popup () {
  return {
    restrict: 'E',
    scope: {
      close: '&onClose',
      initialPosition: '='
    },
    transclude: true,
    link: function(scope, element, attrs) {
    },
    templateUrl: '/assets/templates/popup.html'
  };
}
