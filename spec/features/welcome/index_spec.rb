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
      expect(page).to have_content("Password Confirmation")
    end
  end
end
