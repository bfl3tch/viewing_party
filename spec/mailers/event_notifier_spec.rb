require "rails_helper"

RSpec.describe EventNotifierMailer, type: :mailer do
  before(:each) do
    @user = create(:user, password: "123456", password_confirmation: "123456")
    @friend = create(:user, password: "123456", password_confirmation: "123456")
    # @friend_2 = create(:user, password: "123456", password_confirmation: "123456")
    @friends_ids = []
    @friends_ids << @friend.id
    @event = create(:event, user_id: @user.id)
  end
  describe "new_event_email" do
    let(:mail) { EventNotifierMailer.new_event_email(@user, @friends_ids, @event) }

    it "renders the headers" do
      expect(mail.subject).to eq("You have been invited to watch #{@event.title}")
      expect(mail.to).to eq([@friend.email])
      expect(mail.from).to eq(["hello@VirtualWatchParty.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hello, #{@friend.username}")
      expect(mail.body.encoded).to include("#{@user.username}")
      expect(mail.body.encoded).to include("#{@event.title}")
      expect(mail.body.encoded).to include("#{@event.start_time.strftime("%l:%M %p")}")
      expect(mail.body.encoded).to include("#{@event.day.strftime("%B %d, %Y")}")
    end

    it "sends an email to new user" do
      EventNotifierMailer.new_event_email(@user, @friends_ids, @event).deliver

      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
