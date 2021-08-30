require 'rails_helper'

RSpec.describe Attendee do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end

  describe 'instance methods' do
    before(:each) do
      @user1 = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "111111", password_confirmation: "111111")
      @user2 = create(:user, username: "bob", email: "no@email.com", password: "111111", password_confirmation: "111111")
      @user3 = create(:user, username: "frank", email: "yes@email.com", password: "111111", password_confirmation: "111111")
      @user4 = create(:user, username: "henry", email: "maybe@email.com", password: "111111", password_confirmation: "111111")
      @user1.friends << [@user2, @user3, @user4]
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      @event = Event.create!(title: "Blow", user_id: @user1.id, duration: 150, day: Date.today, start_time: Time.now)
      @attendee1 = Attendee.create!(user_id: @user1.id, event_id: @event.id)
      @attendee2 = Attendee.create!(user_id: @user2.id, event_id: @event.id)
      @attendee3 = Attendee.create!(user_id: @user3.id, event_id: @event.id)
    end
    describe '#determine_attendees' do
      it 'finds the associated user attached to an attendee' do
        expect(@attendee1.determine_attendee).to eq(@user1)
        expect(@attendee2.determine_attendee).to eq(@user2)
        expect(@attendee3.determine_attendee).to eq(@user3)
      end

      it 'knows the associated event' do
        expect(@attendee1.event_id).to eq(@event.id)
        expect(@attendee2.event_id).to eq(@event.id)
        expect(@attendee3.event_id).to eq(@event.id)
      end
    end
  end
end
