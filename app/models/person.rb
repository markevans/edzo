class Person < ActiveRecord::Base
  has_many :person_taggings, :dependent => :destroy
  has_many :tags, :through => :person_taggings, :source => :person_tag

  validates_presence_of :name

  #dragonfly_accessor :image

  def as_json(opts={})
    super.merge(:tag_ids => tag_ids)
  end

  def related_people
    Relationship.where(:person_1_id => id).includes(:person_2).map(&:person_2) +
      Relationship.where(:person_2_id => id).includes(:person_1).map(&:person_1)
  end

  def relation_to(other_person)
    Relationship.where(:person_1_id => id, :person_2_id => other_person.id).first ||
      Relationship.where(:person_1_id => other_person.id, :person_2_id => id).first
  end

end
