require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "confirm" do
    user = FactoryGirl.create(:user, password: "password")
    let(:mail) { UserMailer.confirm user}
     
    it "renders the headers" do
      expect(mail.subject).to eq("Todolist Confirm Your Email")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("/users/confirm/#{user.confirmation_token}")
    end
  end

  describe "welcome" do
    user = FactoryGirl.create(:user, password: "password")
    let(:mail) { UserMailer.welcome user }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Todolist")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("/sign_in")
    end
  end

end
