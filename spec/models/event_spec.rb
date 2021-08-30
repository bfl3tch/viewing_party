require 'rails_helper'

RSpec.describe Event do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:start_time) }
    it { should validate_numericality_of(:duration) }
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

    describe '#determine_host' do
      it 'determines the host for an event' do
        expect(@event.determine_host).to eq(@user1)
      end
    end
  end
end
