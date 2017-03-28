class AddExpiresAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :expires_at, :datetime
  end
end
