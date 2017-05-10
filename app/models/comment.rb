class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, presence: true
  acts_as_votable
  default_scope -> { order(created_at: :asc) } # soonest posts first
end
