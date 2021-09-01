require 'rails_helper'

RSpec.describe EventsFacade do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
    @user2 = create(:user, username: "JamesCameron", email: "jamescameron@email.com", password: "Tester", password_confirmation: "Tester")
    @user3 = create(:user, username: "ChristopherNolan", email: "chrisnolan@email.com", password: "Tester", password_confirmation: "Tester")

    @user.friends << [@user2, @user3]
    @user2.friends << [@user, @user3]
    @user3.friends << [@user, @user2]

    @event = create(:event, user_id: @user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'class methods' do
    describe '::create_attendees' do
      it 'creates friends attendees records given the friends ids and the event', :vcr do
        previous_attendee_count = Attendee.all.count
        @ids = @user.friends.map { |friend| friend.id }
        EventsFacade.create_attendees(@ids, @event)
        new_attendee_count = Attendee.all.count

        expect((new_attendee_count - previous_attendee_count)).to eq(2)
      end

      it 'doesnt create a record for the user, only their friends', :vcr do
        @ids = @user.friends.map { |friend| friend.id }
        EventsFacade.create_attendees(@ids, @event)

        expect(Attendee.find_by(id: @user.id)).to be(nil)
      end

    end

    describe '::create_attendee' do
      it 'creates user attendee records given the user id and the event', :vcr do
        previous_attendee_count = Attendee.all.count
        EventsFacade.create_attendee(@user, @event)
        new_attendee_count = Attendee.all.count

        expect((new_attendee_count - previous_attendee_count)).to eq(1)
        expect(Attendee.find_by(id: Attendee.first.id)).to be_an_instance_of(Attendee)
      end

      it 'doesnt create a record for the friends, only the user', :vcr do
        EventsFacade.create_attendee(@user, @event)

        expect(Attendee.find_by(id: @user.friends.first.id)).to be(nil)
        expect(Attendee.find_by(id: @user.friends.second.id)).to be(nil)
      end
    end
  end
end
