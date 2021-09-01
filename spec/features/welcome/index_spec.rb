require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe "index" do
    before(:each) do
      @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      visit root_path
    end

    it 'is on the right page' do
      expect(current_path).to eq('/')
    end

    it "has login form" do
      expect(page).to have_content("Username")
      expect(page).to have_content("Password")
      expect(page).to have_button("Log In")
    end

    it "can login through welcome page" do
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password

      click_on "Log In"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(@user.username)
    end

    it 'has a link to register if you arent already' do
      expect(page).to have_link("New to Virtual Watch Party? Register Here")
      click_link "New to Virtual Watch Party? Register Here"

      expect(current_path).to eq(registration_path)

      expect(page).to have_content("Username")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Confirm")
    end

    it 'wont allow you to login with the incorrect password' do
      visit(root_path)

      fill_in :username, with: "StevenSpielberg"
      fill_in :password, with: "WrongPassword"
      click_on "Log In"

      expect(page).to have_content('Your password is incorrect, try again.')
      expect(current_path).to eq(root_path)
    end

    it 'wont let you login with a username that doesnt exist' do
      visit(root_path)

      fill_in :username, with: "NonExistingUser"
      fill_in :password, with: "WrongPassword"
      click_on "Log In"

      expect(page).to have_content("That account doesn't exist, try registering it.")
      expect(current_path).to eq(root_path)
    end

    it 'allows you to logout successfully' do
      visit(root_path)
      fill_in :username, with: "StevenSpielberg"
      fill_in :password, with: "Tester"
      click_on "Log In"
      expect(page).to have_content("Welcome, StevenSpielberg!")
      expect(current_path).to eq(dashboard_path)

      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Goodbye, StevenSpielberg!")
    end
  end
end
