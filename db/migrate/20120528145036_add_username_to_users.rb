class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, :null => false
    add_column :users, :username_allow_change, :boolean, :default => false
  end
end
