class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :mov_id
      t.integer :slot_id

      t.timestamps
    end
  end
end
