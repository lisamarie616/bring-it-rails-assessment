class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.integer :invited_event_id
      t.integer :guest_id
      t.string :status

      t.timestamps null: false
    end
  end
end
