class Membership < ActiveRecord::Base
  validates :name, presence: true 
end
