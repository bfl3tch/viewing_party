require 'rails_helper'

RSpec.describe "Discover Page" do
    before(:each) do
      @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit discover_path
    end

    it 'returns the page without error', :vcr do
      expect(page.status_code).to eq(200)
    end


end
