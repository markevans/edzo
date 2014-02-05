window.Person = model({
  init: function () {
    this.relationships = []
  },

  addRelationship: function (rel) {
    this.relationships.push(rel)
  }
})
