require 'rails_helper'

RSpec.describe MoviesService do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'class methods' do
    describe '::connection_setup' do
      it 'establishes the connection and defines the headers', :vcr do
        expect(MoviesService.connection_setup.headers.keys).to include("Authorization")
        expect(MoviesService.connection_setup.headers.keys).to include("Content-Type")
        expect(MoviesService.connection_setup.headers.values[0]).to include("Bearer")
        expect(MoviesService.connection_setup.headers.values).to include("application/json;charset=utf-8")
      end
    end

    describe '::top_20_rated' do
      it 'returns 20 items', :vcr do
        expect(MoviesService.top_20_rated[:results].count).to eq(20)
      end
    end

    describe '::next_20_rated' do
      it 'returns 20 items', :vcr do
        expect(MoviesService.next_20_rated[:results].count).to eq(20)
      end

      it 'those 20 items are different than the first 20 items', :vcr do
        expect(MoviesService.next_20_rated[:results]).to_not eq(MoviesService.top_20_rated[:results])
      end
    end

    describe '::movie_by_id' do
      it 'returns a movie', :vcr do
        expect(MoviesService.movie_by_id(238)[:title]).to eq("The Godfather")
      end
    end

    describe '::movie_credits' do
      it 'returns movie credits', :vcr do
        expect(MoviesService.movie_credits(238)[:cast][0][:name]).to eq("Marlon Brando")
        expect(MoviesService.movie_credits(238)[:cast][1][:name]).to eq("Al Pacino")
      end
    end

    describe '::movie_reviews' do
      it 'returns movie reviews', :vcr do
        expect(MoviesService.movie_reviews(238)[:results][0].keys).to include(:author, :content)
      end
    end

    describe '::search_by_title' do
      it 'returns a movie that you search for', :vcr do
        expect(MoviesService.search_by_title('Godfather')[:results].first[:title]).to include("The Godfather")
        expect(MoviesService.search_by_title('Godfather')[:results].second[:title]).to include("The Godfather: Part II")
      end
    end
  end

end
