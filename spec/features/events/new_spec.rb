require 'rails_helper'

RSpec.describe "Events new page" do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
    @user2 = create(:user, username: "bob", email: "no@email.com", password: "111111", password_confirmation: "111111")
    @user3 = create(:user, username: "frank", email: "yes@email.com", password: "111111", password_confirmation: "111111")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @user.friends << @user2
  end

  it 'has autogenerated values for the event', :vcr do
    @movie = MoviesService.movie_by_id(238)
    visit movie_path(@movie)
    click_on "Create Event for #{@movie[:title]}"
    expect(current_path).to eq(new_event_path)

    expect(find_field(:title).value).to eq("#{@movie[:title]}")
    expect(find_field(:duration).value).to eq("#{@movie[:runtime]}")
  end

  describe 'happy path' do
    it 'lets you create a new event', :vcr do
      @movie = MoviesService.movie_by_id(238)
      visit movie_path(@movie)
      click_on "Create Event for #{@movie[:title]}"
      select "2021", from: "_day_1i"
      select "August", from: "_day_2i"
      select "30", from: "_day_3i"
      fill_in "start_time", with: "21:25"

      expect(Event.all.count).to eq(0)
      click_on "Create Party"

      expect(Event.all.count).to eq(1)
      expect(@user.events.last)
    end

    it 'lets you create a new event with friends', :vcr do
      @movie = MoviesService.movie_by_id(238)
      @user.friends << @user3
      visit movie_path(@movie)
      click_on "Create Event for #{@movie[:title]}"
      select "2021", from: "_day_1i"
      select "August", from: "_day_2i"
      select "30", from: "_day_3i"
      fill_in "start_time", with: "21:25"
      find(:css, "#friends_#{@user2.id}[value=#{@user2.id}]").set(true)
      find(:css, "#friends_#{@user3.id}[value=#{@user3.id}]").set(true)

      expect(Event.all.count).to eq(0)
      click_on "Create Party"

      expect(Event.all.count).to eq(1)
      expect(@user.events.last)
      expect(Event.last.attendees.count).to eq(3)
    end

    it 'gives error with mmissing fields', :vcr do
      @movie = MoviesService.movie_by_id(238)
      visit movie_path(@movie)
      click_on "Create Event for #{@movie[:title]}"
      fill_in :duration, with: " "

      expect(Event.all.count).to eq(0)
      click_on "Create Party"

      expect(Event.all.count).to eq(0)
      expect(page).to have_content("Duration can't be blank and Duration is not a number")
    end


  end
end
