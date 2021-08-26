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

   it "can create a new user" do
     click_on "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "StevenSpielberg"
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: "Tester"
     fill_in "user[password_confirmation]", with: "Tester"

     click_button "Create User"

     expect(current_path).to eq(dashboard_path(User.last.id))
     expect(page).to have_content("Welcome, StevenSpielberg")
   end

   it "won't create a new user with special characters in username" do
     click_on "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "steven@"
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: "Tester"
     fill_in "user[password_confirmation]", with: "Tester"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Username doesn't allow spaces or special characters")
   end


   it "won't create a new user without username" do
     click_on "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: ""
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: "Test"
     fill_in "user[password_confirmation]", with: "Test"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Username can't be blank")
   end

   it "won't create a new user without user email" do
     click_link "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "StevenSpielberg"
     fill_in "user[email]", with: ""
     fill_in "user[password]", with: "Tester"
     fill_in "user[password_confirmation]", with: "Tester"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Email can't be blank and Email is invalid")
   end

   it "won't create a new user without password" do
     click_link "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "StevenSpielberg"
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: ""
     fill_in "user[password_confirmation]", with: "Tester"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Password can't be blank and Password is too short (minimum is 6 characters)")
   end

   it "won't create a new user with password that is too short" do
     click_link "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "steven"
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: "Test"
     fill_in "user[password_confirmation]", with: "Test"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Password is too short (minimum is 6 characters)")
   end

   it "won't create a new user with password that is too long" do
     click_link "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "steven@"
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: "asdlkjfhljkasdghjdlkahlfjkdsgjlkdsfghlkjfdsghjklsdfghljksdfghldfjksghlkdfjsgidfakldfgisdjfg"
     fill_in "user[password_confirmation]", with: "asdlkjfhljkasdghjdlkahlfjkdsgjlkdsfghlkjfdsghjklsdfghljksdfghldfjksghlkdfjsgidfakldfgisdjfg"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Password is too long (maximum is 72 characters)")
   end

   it "won't create a new user without password confirmation match" do
     click_link "New to Virtual Watch Party? Register Here"

     fill_in "user[username]", with: "StevenSpielberg"
     fill_in "user[email]", with: "stevenspielberg@email.com"
     fill_in "user[password]", with: "Tester"
     fill_in "user[password_confirmation]", with: "Testers"

     click_button "Create User"

     expect(current_path).to eq(registration_path)
     expect(page).to have_content("Please fill out all fields")
   end
end
