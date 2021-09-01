class User < ApplicationRecord
  has_secure_password

  has_many :attendees, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :events, through: :attendees

  validates :username, presence: true
  validates :username, format: { with: /\A\w+\z/, message: "doesn't allow spaces or special characters" }
  validates :username, uniqueness: { case_sensitive: false }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { within: 6..70 }
end
