class EventNotifierMailer < ApplicationMailer
  def new_event_email(user, friends, event)
    @user = user
    @event = event

    friends_list = friends.map do |friend_id|
      User.find_by_id(friend_id)
    end

    friends_list.each do |user|
      @friend = user
      mail(to: user.email, subject: "You have been invited to watch #{@event.title}")
    end
  end
end
