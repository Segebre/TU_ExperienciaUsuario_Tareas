class Post < ActiveRecord::Base
  has_many :comments
  validates :message, presence: true, length: { maximum: 300 }
end
