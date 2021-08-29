require 'rails_helper'

RSpec.describe "Movies show Page" do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
    @user2 = create(:user, username: "bob", email: "no@email.com", password: "111111", password_confirmation: "111111")
    @user3 = create(:user, username: "frank", email: "yes@email.com", password: "111111", password_confirmation: "111111")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'returns the page without error', :vcr do
    @movie = API.movie_by_id(238)

    visit movie_path(@movie)
    expect(page.status_code).to eq(200)
  end

  it 'returns the page with movie title', :vcr do
    @movie = API.movie_by_id(238)

    visit movie_path(@movie)
    expect(page).to have_content(@movie[:title])
  end

  it 'returns the page with movie attributes', :vcr do
    @movie = API.movie_by_id(238)

    visit movie_path(@movie)

    expect(page).to have_content(@movie[:overview])
    expect(page).to have_content(@movie[:vote_average])
    expect(page).to have_content(@movie[:runtime].to_i/60)
    expect(page).to have_content(@movie[:runtime].to_i%60)
  end

  it 'returns the page with movie genres', :vcr do
    @movie = API.movie_by_id(238)

    visit movie_path(@movie)

    expect(page).to have_content(@movie[:genres][0][:name])
    expect(page).to have_content(@movie[:genres][1][:name])
  end

  it 'returns the page with the first 10 movie cast members', :vcr do
    @movie = API.movie_by_id(238)
    @movie_credits = API.movie_credits(238)

    visit movie_path(@movie)

    expect(page).to have_content(@movie_credits[:cast][0][:name])
    expect(page).to have_content(@movie_credits[:cast][0][:character])

    expect(page).to have_content(@movie_credits[:cast][1][:name])
    expect(page).to have_content(@movie_credits[:cast][1][:character])

    expect(page).to have_content(@movie_credits[:cast][9][:name])
    expect(page).to have_content(@movie_credits[:cast][9][:character])

    expect(page).to_not have_content(@movie_credits[:cast][10][:name])
    expect(page).to_not have_content(@movie_credits[:cast][10][:character])
  end

  it 'returns the page with the movie reviews', :vcr do
    @movie = API.movie_by_id(238)
    @movie_reviews = API.movie_reviews(238)

    visit movie_path(@movie)

    expect(page).to have_content(@movie_reviews[:results][0][:author])
    expect(page).to have_content("The Godfather is a film considered by most")
  end

  it 'returns the page with the total movie reviews', :vcr do
    @movie = API.movie_by_id(238)
    @movie_reviews = API.movie_reviews(238)

    visit movie_path(@movie)

    expect(page).to have_content(@movie_reviews[:results].count)
  end

  it 'can create a viewing party', :vcr do
    @movie = API.movie_by_id(238)
    @movie_credits = API.movie_credits(238)
    @movie_reviews = API.movie_reviews(238)

    @user.friends << @user2

    visit movie_path(@movie)

    click_on "Create Event for #{@movie[:title]}"
    expect(current_path).to eq(new_event_path)

    expect(page).to have_content("Movie Title")
    expect(page).to have_content("Duration of Event")
    expect(page).to have_content("Day")
    expect(page).to have_content(@user2.name)

    expect(page).to_not have_content(@user3.name)
  end
end
