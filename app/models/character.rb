class Character < ActiveRecord::Base
  belongs_to :membership
  has_many :comments, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all

  validates :name, :email, presence: true, uniqueness: true

  def self.roles
    ["Heroe", "Villain"]
  end
end
