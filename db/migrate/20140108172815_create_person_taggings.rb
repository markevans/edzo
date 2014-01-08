class CreatePersonTaggings < ActiveRecord::Migration
  def change
    create_table :person_taggings do |t|
      t.integer :person_id
      t.integer :person_tag_id
      t.timestamps
    end
    add_index :person_taggings, :person_id
    add_index :person_taggings, :person_tag_id
  end
end
