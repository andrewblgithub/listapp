class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  default_scope -> { order(expires_at: :asc) } # soonest posts first
end
