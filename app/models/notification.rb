class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  scope :pending, where(:mailed => false)
  scope :notified, where(:mailed => true)

end
