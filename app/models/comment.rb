class Comment < ActiveRecord::Base
  belongs_to :character
  belongs_to :post
  validates :character_id, :message, presence: true
end
