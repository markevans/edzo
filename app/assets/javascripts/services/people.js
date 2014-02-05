function people ($resource) {
  var resource = $resource('/people/:id')

  return {
    all: function (cb) { return resource.query(cb) },
    get: function (id) { return resource.get({id: id}) }
  }
}
