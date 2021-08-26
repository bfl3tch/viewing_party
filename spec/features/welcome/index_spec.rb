require 'rails_helper'

RSpec.describe 'The welcome landing page' do
  before(:each) do
    visit root_path
  end

  it 'is on the right page' do
    expect(current_path).to eq('/')
  end

  it 'has a form to login' do
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")

    expect(page).to have_button("Log In")
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
