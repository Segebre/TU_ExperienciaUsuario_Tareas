class Post < ActiveRecord::Base
  belongs_to :character
  has_many :comments, :dependent => :delete_all
  validates :message, presence: true, length: { maximum: 300 }
end
