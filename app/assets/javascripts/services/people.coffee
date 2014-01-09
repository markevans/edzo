class @People

  constructor: ($resource) ->
    @resource = $resource('/people/:id')

  all: -> @resource.query()

  get: (id) -> @resource.get({id})
