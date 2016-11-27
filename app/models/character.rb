class Character < ActiveRecord::Base
  belongs_to :membership
  has_many :posts
  has_many :comments

  validates :name, :email, presence: true, uniqueness: true
end
