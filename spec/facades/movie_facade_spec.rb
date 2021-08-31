require 'rails_helper'

RSpec.describe APIS::MoviesFacade do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'class methods' do
    describe '::top_40_movies_array' do
      it 'combines the two MoviesService calls into a single results array of the 40 movies data', :vcr do
        expect(APIS::MoviesFacade.top_40_movies_array.count).to eq(40)

      end
    end

  end
end
