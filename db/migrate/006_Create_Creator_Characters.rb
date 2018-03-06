class CreateCreatorCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :creatorcharacters do |t|
      t.integer :creator_id
      t.integer :character_id
    end
  end
end
