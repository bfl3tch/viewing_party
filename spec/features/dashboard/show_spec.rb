
require 'rails_helper'

RSpec.describe "Dashboard Page" do
  describe 'happy path' do
    before(:each) do
      @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      visit root_path
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on 'Log In'
    end

    it 'is on the right page' do
      expect(current_path).to eq('/dashboard')
    end

    it 'has a welcome message for the user' do
      expect(page).to have_content("Welcome #{@user.username}")
    end

    it "has a link to discover movies" do
      expect(page).to have_content("Discover Movies")
    end
  end

  describe 'sad path' do
    it 'wont let you view this page if youre not logged in' do
      visit dashboard_path
      expect(page).to have_content("You must login to visit that page.")
    end
  end
end
