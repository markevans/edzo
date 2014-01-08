class PersonTagging < ActiveRecord::Base
  belongs_to :person
  belongs_to :person_tag
end
