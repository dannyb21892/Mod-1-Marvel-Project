class CreateCharacterComics < ActiveRecord::Migration[4.2]
  def change
    create_table :character_comics do |t|
      t.integer :character_id
      t.integer :comic_id
    end
  end
end
