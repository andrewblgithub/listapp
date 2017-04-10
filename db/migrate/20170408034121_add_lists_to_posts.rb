class AddListsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :list, :string
  end
end
