class List < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  has_many :memberships
  has_many :users, through: :memberships
  
end
