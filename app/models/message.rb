class Message < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :notifications

  has_ancestry

  validates :group_id, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true

  after_create do
    self.group.users.each do |user|
      Notification.create(:user_id => user.id, :message_id => self.id, :mailed => false)
    end
  end


  def root
    self.parent.present? ? self.parent : self
  end
end
