class Character < ActiveRecord::Base
  belongs_to :membership

  validates :name, :email, presence: true, uniqueness: true
end
