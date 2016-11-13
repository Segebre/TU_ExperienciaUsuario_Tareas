class Post < ActiveRecord::Base
  validates :message, presence: true, length: { maximum: 300 }
end
