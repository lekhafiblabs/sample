class AddUsernamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :usernames, :string
  end
end
