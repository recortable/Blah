class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :notifications
  has_secure_password

  validates :name, :presence => true
  validates :email, :presence => true

  def super?
    self.id == 2
  end

end
