window.draggable = (function () {

  var positionOf = function (event) {
    event = event.touches ? event.touches[0] : event
    return {
      x: event.pageX,
      y: event.pageY
    }
  }

  return function ($document) {

    return {
      scope: {
        position: '=?draggablePosition',
        initialPosition: '=?draggableInitialPosition'
      },
      link: function ($scope, $element) {
        if (!$scope.position) {
          $scope.position = $scope.initialPosition || {x: 0, y: 0}
        }

        var endEvents = 'touchend touchcancel mouseup mouseleave',
            moveEvents = 'touchmove mousemove',
            startEvents = 'touchstart mousedown',
            handle = $element.find('[draggable-handle]')

        $scope.$watch('position', function (newPosition) {
          $element.css({
            left: newPosition.x,
            top: newPosition.y
          })
        }, true)

        $document.bind(endEvents, function (event) {
          event.preventDefault()
          $document.unbind(moveEvents)
        })

        handle.bind(startEvents, function (event) {
          event.preventDefault()

          var startMousePosition = positionOf(event),
              startX = $scope.position.x,
              startY = $scope.position.y

          $document.bind(moveEvents, function (event) {
            event.preventDefault()

            var currentMousePosition = positionOf(event)

            $scope.$apply(function () {
              $scope.position = {
                x: startX + (currentMousePosition.x - startMousePosition.x),
                y: startY + (currentMousePosition.y - startMousePosition.y)
              }
            })
          })
        })

      }
    }
  }

})()
