class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :list
  validates :user_id, presence: true
  acts_as_votable
  default_scope -> { order(created_at: :asc) } # soonest posts first
end
