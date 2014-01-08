class CreatePersonTags < ActiveRecord::Migration
  def change
    create_table :person_tags do |t|
      t.string :name
      t.string :colour
      t.integer :person_tagging_id
      t.timestamps
    end
    add_index :person_tags, :person_tagging_id
  end
end
