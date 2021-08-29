require 'rails_helper'

RSpec.describe "The Movies Index page" do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit movies_path
  end

  it 'returns the page without error', :vcr do
    expect(page.status_code).to eq(200)
  end

  it 'displays the movie names', :vcr do
    expect(page).to have_content("The Godfather")
  end

  it 'displays the movie ratings', :vcr do
    expect(page).to have_content("Rating: 8.6")
  end

  it 'displays a function link to each movies show page', :vcr do
    expect(page).to have_link("The Godfather")
  end
end
