function peopleAndRelationships (people, relationships, $q) {

  var createLookup = function (models) {
    var lookup = {}
    models.forEach(function (model) {
      lookup[model.id] = model
    })
    return lookup
  }

  return {
    all: function (callback) {

      $q.all([
        people.all().$promise,
        relationships.all().$promise
      ]).then( function (data) {

        var peeps = data[0].map(function (attrs) { return new window.Person(attrs) }),
            rels = data[1].map(function (attrs) { return new window.Relationship(attrs) }),
            peopleLookup = createLookup(peeps)

        rels.forEach(function (relationship) {
          peopleLookup[relationship.person_1_id].addRelationship(relationship)
          peopleLookup[relationship.person_2_id].addRelationship(relationship)
        })

        callback(peeps, rels)
      })
    }
  }
}
