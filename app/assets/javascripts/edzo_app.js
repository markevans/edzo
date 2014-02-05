edzoApp = angular.module('edzoApp', ['ngResource'])

  .config(function ($httpProvider) {
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = $('meta[name="csrf-token"]').attr('content')
  })

  .service('people', restService('people'))
  .service('relationships', restService('relationships'))
  .service('positioner', positioner)
  .directive('draggable', draggable)
