window.model = function (prototype) {

  var copy = function (src, dest) {
    for(var key in src) {
      if ( src.hasOwnProperty(key) ) {
        dest[key] = src[key]
      }
    }
  }

  var Constructor = function Model (attrs) {
    copy(attrs, this)
    if( this.init ) { this.init(attrs) }
  }
  Constructor.prototype = prototype

  return Constructor
}
