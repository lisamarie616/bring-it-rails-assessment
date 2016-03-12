class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :invited_event_id
      t.integer :guest_id
      t.string :status

      t.timestamps null: false
    end
  end
end
