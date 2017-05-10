class Post < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :comments, dependent: :destroy
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  
  default_scope -> { order(expires_at: :asc) } # soonest posts first
  
  acts_as_votable
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  
end
