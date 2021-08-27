require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user = create(:user, username: "StevenSpielberg", email: "stevenspielberg@email.com", password: "Tester", password_confirmation: "Tester")
  end

  it "creates a new session with a welcome message" do
    allow(@user).to receive(:authenticate).and_return @user

    post :create, params: { username: @user.username, password: @user.password}

    expect(session[:user_id]).to eq(@user.id)
    expect(flash[:success]).to match("Welcome, #{@user.username}!")
  end

  it "does not create a new session with unsuccessful login" do
    allow(@user).to receive(:authenticate).and_return @user

    post :create, params: { username: @user.username, password: "badpassword"}

    expect(session[:user_id]).to eq(nil)
    expect(flash[:error]).to match(@user.errors.full_messages.to_sentence)
  end

  it "does not create a new session with unsuccessful login" do
    allow(@user).to receive(:authenticate).and_return @user

    post :create, params: { username: "", password: ""}

    expect(session[:user_id]).to eq(nil)
    expect(flash[:error]).to match(@user.errors.full_messages.to_sentence)
  end

  it "deletes a session upon logout" do
    allow(@user).to receive(:authenticate).and_return @user
    post :create, params: { username: @user.username, password: @user.password}

    expect(session[:user_id]).to eq(@user.id)

    delete :destroy

    expect(session[:user_id]).to eq(nil)
  end
end
