class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  acts_as_votable
  default_scope -> { order(created_at: :asc) } # soonest posts first
end
