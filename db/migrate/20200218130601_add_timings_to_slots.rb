class AddTimingsToSlots < ActiveRecord::Migration[6.0]
  def change
    add_column :slots, :timings, :datetime
  end
end
