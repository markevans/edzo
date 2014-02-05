function restService (namespace) {
  return function ($resource) {
    var resource = $resource('/'+namespace+'/:id')

    return {
      all: function (cb) { return resource.query(cb) },
      get: function (id) { return resource.get({id: id}) }
    }
  }
}
