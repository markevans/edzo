edzoApp = angular.module('edzoApp', ['ngResource'])

  .config(function ($httpProvider) {
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = $('meta[name="csrf-token"]').attr('content')
  })

  .service('people', people)
  .service('positioner', positioner)

  .directive('draggable', draggable)
