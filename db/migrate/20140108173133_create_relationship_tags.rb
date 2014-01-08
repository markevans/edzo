class CreateRelationshipTags < ActiveRecord::Migration
  def change
    create_table :relationship_tags do |t|
      t.string :name
      t.string :colour
      t.timestamps
    end
  end
end
