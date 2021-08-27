
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
      expect(page).to have_content(@user2.username)
      expect(page).to_not have_content(@user3.username)
    end

    it 'displays a button to add a friend by their registered email address' do
      expect(page).to_not have_content(@user3.username)

      fill_in "Friend's Email", with: "yes@email.com"
      click_on "Add Friend"

      expect(page).to have_content(@user3.username)
    end

    it 'displays a message if the search for a friend was unsuccessful' do
      expect(page).to_not have_content(@user3.username)

      fill_in "Friend's Email", with: "bad@email.com"
      click_on "Add Friend"

      expect(page).to_not have_content(@user2.username)
      expect(page).to_not have_content(@user3.username)
      expect(page).to have_content("I'm sorry, your friend cannot be found.")
    end
  end

  describe 'unauthorized user functionality' do
    it 'wont let you view this page if youre not logged in' do
      visit dashboard_path
      expect(page).to have_content("You must login to visit that page.")
    end
  end
end
