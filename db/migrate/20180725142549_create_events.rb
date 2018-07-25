class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_day
      t.integer :start_index
      t.integer :end_index
      t.string :event_color
      t.integer :user_id
    end
  end
end
