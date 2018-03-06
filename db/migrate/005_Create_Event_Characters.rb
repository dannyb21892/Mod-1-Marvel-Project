class CreateEventCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :eventcharacters do |t|
      t.integer :event_id
      t.integer :character_id
    end
  end
end
