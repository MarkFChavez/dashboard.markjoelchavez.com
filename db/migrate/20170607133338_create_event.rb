class CreateEvent < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.column :title, :string
      t.column :start_time, :date
      t.column :end_time, :date
      t.column :user_id, :int

      t.timestamps
    end

    add_index :events, :title
    add_index :events, :user_id
  end
end
