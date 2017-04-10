class AddListIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :list_id, :integer
  end
end
