class Relationship < ActiveRecord::Base
  belongs_to :person_1, :class_name => 'Person'
  belongs_to :person_2, :class_name => 'Person'
  belongs_to :tag, :class_name => 'RelationshipTag'
  
  validates_presence_of :person_1, :person_2
  
  def as_json(opts={})
    super.merge(:tag_id => tag_id)
  end
end
