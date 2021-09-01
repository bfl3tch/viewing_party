class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  validates :title, presence: true
  validates :user_id, presence: true
  validates :duration, presence: true, numericality: true
  validates :day, presence: true
  validates :start_time, presence: true

  def determine_host
    User.joins(:events).where('users.id = ?', user_id).first
  end
end
