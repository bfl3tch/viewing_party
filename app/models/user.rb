class User < ApplicationRecord
  has_secure_password
  # attr_accessor :password

  has_many :events
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :attendees, through: :events

  validates :password, :length => {:within => 6..70}
  validates :username, presence: true, format: { with: /\A\w+\z/, message: "doesn't allow spaces or special characters" }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password_confirmation, presence: true, on: :create
  # validates :password, confirmation: { case_sensitive: true }
  # validates :password, confirmation: true
  # validates :password, presence: true, on: :create

  # validates_presence_of :password true
  # validates_confirmation_of :password

end
