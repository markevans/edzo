class RelationshipTag < ActiveRecord::Base
  has_many :relationships, :foreign_key => :tag_id
  
  validates_presence_of :name, :colour
  validates_uniqueness_of :name
  
  def colour=(colour)
    colour = "##{colour}" if colour =~ /^\w{6}$/
    super(colour)
  end
end
