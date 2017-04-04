class AddCachedLikesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :cached_votes_total, :integer
    Post.find_each(&:update_cached_votes)
  end
end
