class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :person_1_id
      t.integer :person_2_id
      t.integer :tag_id
      t.text :description
      t.timestamps
    end
    add_index :relationships, :person_1_id
    add_index :relationships, :person_2_id
    add_index :relationships, :tag_id
  end
end
