class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def determine_attendee
    Attendee.joins(:events).where('attendees.event_id = ?', self.id)
  end
end
