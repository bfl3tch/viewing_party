
require 'rails_helper'

RSpec.describe "Dashboard Page" do
  describe 'authorized user functionality' do
    before(:each) do
      @user1 = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      @user2 = create(:user, username: "bob", email: "no@email.com", password: "111111", password_confirmation: "111111")
      @user3 = create(:user, username: "frank", email: "yes@email.com", password: "111111", password_confirmation: "111111")

      visit root_path

      fill_in :username, with: @user1.username
      fill_in :password, with: @user1.password
      click_on 'Log In'
    end

    it 'is on the right page' do
      expect(current_path).to eq('/dashboard')
    end

    it 'has a welcome message for the user' do
      expect(page).to have_content("Welcome #{@user1.username}")
    end

    it "has a link to discover movies" do
      expect(page).to have_content("Discover Movies")
    end

    it 'displays the users friend list' do
      expect(page).to have_content("Friends")
    end

    it 'displays that they dont have any friends if that is the case' do
      expect(page).to have_content("You currently have no friends.")
      expect(page).to_not have_content(@user2.username)
      expect(page).to_not have_content(@user3.username)
    end

    it 'displays the friends if they exist but not other users' do
      @user1.friends << @user2
      visit dashboard_path

      expect(page).to have_content(@user2.username)
      expect(page).to_not have_content(@user3.username)
    end

    it 'displays a button to add a friend by their registered email address' do
      expect(page).to_not have_content(@user3.username)

      fill_in :search, with: "yes@email.com"
      click_on "Add Friend"

      expect(page).to have_content(@user3.username)
      expect(current_path).to eq(dashboard_path)
    end

    it 'displays a message if the search for a friend was unsuccessful' do
      expect(page).to_not have_content(@user3.username)

      fill_in :search, with: "bad@email.com"
      click_on "Add Friend"
      expect(page).to_not have_content(@user2.username)
      expect(page).to_not have_content(@user3.username)
      expect(page).to have_content("I'm sorry your friend cannot be found.")
      expect(current_path).to eq(dashboard_path)
    end

    it 'wont let a user add themself to their own friends list' do
      visit dashboard_path
      fill_in :search, with: @user1.email
      click_on "Add Friend"

      within 'section#friends' do
        expect(page).to_not have_content(@user1.username)
      end

      expect(page).to have_content("You can't add yourself as a friend.")
      expect(current_path).to eq(dashboard_path)
    end

    it 'wont let a user add the same friend twice' do
      visit dashboard_path
      fill_in :search, with: @user2.email
      click_on "Add Friend"

      within 'section#friends' do
        expect(page).to have_content(@user2.username)
      end

      expect(current_path).to eq(dashboard_path)
      fill_in :search, with: @user2.email
      click_on "Add Friend"

      expect(page).to have_content("That friend is already...a friend.")
    end

    it "shows all viewing parties user was invited to" do
      @user1.friends << [@user2, @user3]
      @event = create(:event, user_id: @user2.id)

      @attendees = Attendee.create!(user_id: @user2.id, event_id: @event.id)
      @attendees2 = Attendee.create!(user_id: @user1.id, event_id: @event.id)

      visit dashboard_path

      expect(page).to have_content(@event.title)
      expect(page).to have_content(@event.duration)
      expect(page).to have_content(@event.day.strftime("%B %d, %Y"))
      expect(page).to have_content(@event.start_time.strftime("%l:%M %p"))
      expect(page).to have_content("Invited")
    end

    it "shows all viewing parties user was invited to" do
      @user1.friends << [@user2, @user3]
      @event = create(:event, user_id: @user2.id)

      @attendees = Attendee.create!(user_id: @user2.id, event_id: @event.id)
      @attendees2 = Attendee.create!(user_id: @user1.id, event_id: @event.id)

      visit dashboard_path

      expect(page).to have_content(@event.title)
      expect(page).to have_content(@event.duration)
      expect(page).to have_content(@event.day.strftime("%B %d, %Y"))
      expect(page).to have_content(@event.start_time.strftime("%l:%M %p"))
      expect(page).to have_content("Invited")
      expect(page).to have_content(@user2.username)
    end
  end

  describe 'unauthorized user functionality' do
    it 'wont let you view this page if youre not logged in' do
      visit dashboard_path
      expect(page).to have_content("You must login to visit that page.")
    end
  end
end
