class User < ApplicationRecord
  has_secure_password
  # attr_accessor :password
  # validates_confirmation_of
  has_many :events, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :attendees, through: :events

  validates :username, presence: true
  validates :username, format: { with: /\A\w+\z/, message: "doesn't allow spaces or special characters" }
  validates :username, uniqueness: { case_sensitive: false }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { within: 6..70 }
  # validates :password_confirmation, presence: true, on: :create
  # validates :password, confirmation: { case_sensitive: true }
  # validates :password, confirmation: true
  # validates :password, presence: true, on: :create

  # validates_presence_of :password true
  # validates_confirmation_of :password

  def self.find_by_email(search)
    User.where('lower(email) LIKE ?', "%#{search.downcase}%")
  end
end
