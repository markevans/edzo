namespace :db do
  desc "Populate the db with test data"
  task :populate => :environment do
    Person.destroy_all
    100.times do
      Person.create! :name => Faker::Name.name
    end

    Relationship.destroy_all
    people = Person.all
    people.each do |person|
      2.times do
        other_person = people.sample
        Relationship.create! :person_1 => person, :person_2 => other_person unless other_person == person
      end
    end
  end
end
