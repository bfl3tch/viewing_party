class EventsFacade

  def self.create_attendees(friends, event)
    friends.each { |f| Attendee.create(user_id: f.to_i, event_id: event.id) }
  end

  def self.create_attendee(user, event)
    Attendee.create(user_id: user.id, event_id: event.id)
  end

end
