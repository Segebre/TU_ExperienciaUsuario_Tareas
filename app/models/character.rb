class Character < ActiveRecord::Base
  has_secure_password
  belongs_to :membership
  has_many :comments, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all

  validates :name, :email, presence: true, uniqueness: true

  before_save :default_avatar_url

  def self.roles
    ["Heroe", "Villain"]
  end

  protected
    def default_avatar_url
      if self.avatar_url.blank?
        self.avatar_url = 'https://tracker.moodle.org/secure/attachment/30912/f3.png'
      end
    end
end
