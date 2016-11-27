class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, :message, presence: true
end
