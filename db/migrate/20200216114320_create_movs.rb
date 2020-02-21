class CreateMovs < ActiveRecord::Migration[6.0]
  def change
    create_table :movs do |t|
      t.string :moviename
      t.string :cast
      t.string :lang

      t.timestamps
    end
  end
end
