class CreateEventCreators < ActiveRecord::Migration[5.1]
  def change
    create_table :eventcreators do |t|
      t.integer :event_id
      t.integer :creator_id
    end
  end
end
