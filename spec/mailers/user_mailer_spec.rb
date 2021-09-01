require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  before(:each) do
    @user = create(:user, password: "123456", password_confirmation: "123456")
  end
  describe "account_setup" do
    let(:mail) { UserMailer.account_setup(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Virtual Watch Party")
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(["hello@VirtualWatchParty.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("welcome to Virtual Watch Party")
      expect(mail.body.encoded).to include("#{@user.username}")
    end

    it "sends an email to new user" do
      UserMailer.account_setup(@user).deliver
      
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
