require 'rails_helper'

RSpec.describe "Discover Page" do
    before(:each) do
      @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      # visit root_path
      # fill_in :username, with: @user.username
      # fill_in :password, with: @user.password
      # click_on 'Log In'
      # click_on 'Discover Movies'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path
    end

    # it 'is on the right page' do
    #   expect(current_path).to eq('/discover')
    # end

    it 'returns the top 20 movies data', :vcr do
      click_on "Discover Movies"

      expect(page.status_code).to eq(200)
      save_and_open_page
    end
end
