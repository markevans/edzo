function PeopleFactory($resource) {
  return $resource('/people/:id')
}
