class Post < ActiveRecord::Base
  belongs_to :character
  has_many :comments
  validates :message, presence: true, length: { maximum: 300 }
end
