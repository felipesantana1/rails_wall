class Message < ActiveRecord::Base

  validates :content, presence: true, length: { in: 10..255 }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
