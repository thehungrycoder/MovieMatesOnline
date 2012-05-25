class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :location, :string

  end
end
