window.draggable = (function () {

  var position = function (event) {
    event = event.touches ? event.touches[0] : event
    return {
      x: event.pageX,
      y: event.pageY
    }
  }

  return function ($document) {

    return {
      scope: {},
      link: function ($scope, $element) {
        console.log($scope)
        var endEvents = 'touchend touchcancel mouseup mouseleave',
            moveEvents = 'touchmove mousemove',
            startEvents = 'touchstart mousedown'

        $document.bind(endEvents, function (event) {
          event.preventDefault()
          $document.unbind(moveEvents)
        })

        $element.bind(startEvents, function (event) {
          event.preventDefault()

          var startLeft = parseInt( $element.css('left') ) || 0,
              startTop = parseInt( $element.css('top') ) || 0,
              startPosition = position(event)

          $document.bind(moveEvents, function (event) {
            event.preventDefault()

            var currentPosition = position(event)

            $element.css({
              left: startLeft + (currentPosition.x - startPosition.x),
              top: startTop + (currentPosition.y - startPosition.y)
            })
          })
        })

      }
    }
  }

})()
