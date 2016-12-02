class Post < ActiveRecord::Base
  belongs_to :character
  has_many :comments, :dependent => :delete_all
  validates :message, presence: true, length: { maximum: 300 }

  before_create :default_scheduled_at

  protected
    def default_scheduled_at
      if self.scheduled_at == nil
        self.scheduled_at = Time.now
      end
    end
end
