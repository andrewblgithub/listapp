class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  default_scope -> { order(created_at: :desc) } # newest posts first
end
