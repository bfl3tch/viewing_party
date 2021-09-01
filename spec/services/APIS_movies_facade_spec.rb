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
  end
end
