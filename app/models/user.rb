class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..50 }
  validates :password, presence: true, on: :create

  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password
end
