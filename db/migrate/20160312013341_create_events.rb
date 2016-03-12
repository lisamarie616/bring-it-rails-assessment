class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :host_id

      t.timestamps null: false
    end
  end
end
