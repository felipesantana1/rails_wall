class Comment < ActiveRecord::Base

  validates :content, presence: true, length: { in: 10..255 }
  validates :user, :message, presence: true
  
  belongs_to :user
  belongs_to :message
end
