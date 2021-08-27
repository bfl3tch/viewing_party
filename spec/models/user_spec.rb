require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_many(:attendees).through(:events) }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
  end

  describe 'class methods' do
    before(:each) do
      @user1 = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
      @user2 = create(:user, username: "bob", email: "no@email.com", password: "111111", password_confirmation: "111111")
      @user3 = create(:user, username: "frank", email: "yes@email.com", password: "111111", password_confirmation: "111111")
    end

    describe '::find_by_email' do
      xit 'finds a user based on their email and only returns that user' do
        expect(User.find_by_email(@user2.email)).to include(@user2)
        expect(User.find_by_email(@user2.email)).to_not include(@user1)
        expect(User.find_by_email(@user2.email)).to_not include(@user3)
      end
    end
  end
end
