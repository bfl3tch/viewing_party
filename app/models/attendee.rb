class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def determine_attendee
    User.where('users.id = ?', user_id).first
  end
end
