class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def determine_attendee
    User.where('users.id = ?', self.user_id).first
  end
end
