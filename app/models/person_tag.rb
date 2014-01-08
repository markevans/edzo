class PersonTag < ActiveRecord::Base
  has_many :person_taggings, :dependent => :destroy
  has_many :people, :through => :person_taggings
  
  validates_presence_of :name, :colour
  validates_uniqueness_of :name
  
  def colour=(colour)
    colour = "##{colour}" if colour =~ /^\w{6}$/
    super(colour)
  end
end
