class CreateCreatorCharacters < ActiveRecord::Migration[4.2]
  def change
    create_table :creator_characters do |t|
      t.integer :creator_id
      t.integer :character_id
    end
  end
end
