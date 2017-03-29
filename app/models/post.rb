class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  acts_as_commentable
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  default_scope -> { order(expires_at: :asc) } # soonest posts first
end
