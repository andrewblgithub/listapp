class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string # add new column to table users called username with type string
    add_index :users, :username, unique: true # index usernames for quick lookup and ensure uniqueness
  end
end
