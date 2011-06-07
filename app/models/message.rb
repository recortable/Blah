class Message < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_ancestry

  validates :group_id, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true


  def root
    self.parent.present? ? self.parent : self
  end
end
