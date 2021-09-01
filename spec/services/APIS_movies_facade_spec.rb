require 'rails_helper'

RSpec.describe APIS::MoviesFacade do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'class methods' do
    describe '::top_40_movies_array' do
      it 'returns an array of 40 movie objects for the controller to use', :vcr do
        result = APIS::MoviesFacade.top_40_movies_array

        expect(result).to be_a(Array)
        expect(result.count).to eq(40)
        expect(result.first).to be_an_instance_of(TopFortyMovies)
      end
    end

    describe '::find_by_title' do
      it 'returns an a list of movie objects matching that title', :vcr do
        result = APIS::MoviesFacade.find_by_title('Godfather')

        expect(result).to be_a(Array)
        expect(result.first.title).to include('Godfather')
        expect(result.first).to be_an_instance_of(FoundMovie)
      end

      it 'returns an empty array if there are no similar titles', :vcr do
        result = APIS::MoviesFacade.find_by_title('udashfasjdfhlakdsjfhladjksfh')

        expect(result).to be_an(Array)
        expect(result.empty?).to eq(true)
      end
    end

    describe '::find_by_id' do
      it 'returns a single movie object if given the id in the API database', :vcr do
        result = APIS::MoviesFacade.find_by_id(238)

        expect(result.title).to eq('The Godfather')
        expect(result).to be_an_instance_of(FoundMovie)
      end

      it 'returns a fake movie object with no attributes if the id doesnt match a movie in the database', :vcr do
        result = APIS::MoviesFacade.find_by_id(0)

        expect(result).to be_an_instance_of(FoundMovie)
        expect(result.title).to eq(nil)
      end
    end

    describe '::get_movie_credits' do
      it 'returns a grouping of movie credit objects given the movies API id', :vcr do
        result = APIS::MoviesFacade.get_movie_credits(238)

        expect(result).to be_an(Array)
        expect(result.first).to be_an_instance_of(CastMember)
      end
    end

    describe '::get_movie_reviews' do
      it 'returns a grouping of movie review objects given the movies API id', :vcr do
        result = APIS::MoviesFacade.get_movie_reviews(238)

        expect(result).to be_an(Array)
        expect(result.first).to be_an_instance_of(MovieReview)
      end
    end
  end
end
