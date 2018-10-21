class User < ApplicationRecord
  validates :email, presence: true
  # validates :password, length: { in: 6..20 }
  has_many :conversations
  has_many :messages, through: :conversations
end
