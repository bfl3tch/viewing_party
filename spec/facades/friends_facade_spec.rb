require 'rails_helper'

RSpec.describe FriendsFacade do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
    @user2 = create(:user, username: "JamesCameron", email: "jamescameron@email.com", password: "Tester", password_confirmation: "Tester")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'class methods' do
    describe '::add_friend' do
      it 'creates a friendship between the user and the new friend', :vcr do
        previous_friends_count = Friendship.all.count
        FriendsFacade.add_friend(@user, @user2)

        expect(Friendship.all.count).to_not eq(previous_friends_count)
        expect(@user.friends.include?(@user2)).to eq(true)
      end

      it 'doesnt create a friendship the other direction' do
        FriendsFacade.add_friend(@user, @user2)

        expect(@user2.friends.include?(@user)).to eq(false)
      end

      it 'allows the other user to then friend the other direction' do
        FriendsFacade.add_friend(@user, @user2)

        expect(@user.friends.include?(@user2)).to eq(true)
        expect(@user2.friends.include?(@user)).to eq(false)

        FriendsFacade.add_friend(@user2, @user)

        expect(@user.friends.include?(@user2)).to eq(true)
        expect(@user2.friends.include?(@user)).to eq(true)
      end
    end
  end
end
