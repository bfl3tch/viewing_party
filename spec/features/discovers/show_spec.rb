require 'rails_helper'

RSpec.describe "Discover Page" do
    before(:each) do
      @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      visit root_path
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on 'Log In'
      click_on 'Discover Movies'
    end

    it 'is on the right page' do
      expect(current_path).to eq('/discover')
    end
end
