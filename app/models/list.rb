class List < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :user_id, presence: true
  has_many :memberships
  has_many :users, through: :memberships
  
end
