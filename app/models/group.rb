class Group < ActiveRecord::Base
  has_many :memberships
  has_many :messages
  has_many :users, :through => :memberships

  validates :name, :presence => true
  validates :subdomain, :presence => true
end
