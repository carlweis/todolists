require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "Visitor signs up" do
  scenario "by navigating to the page" do
    visit sign_in_path

    click_link I18n.t("sessions.form.sign_up")

    expect(current_path).to eq sign_up_path
  end

  scenario "with valid username, email and password" do
    sign_up_with "testuser", "valid@example.com", "password"
    expect(current_path).to eq sign_in_path
    #expect(flash[:notice]).to eq "Please confirm your email address"
  end

  scenario "tries with invalid email" do
    sign_up_with "testuser", "invalid_email", "password"

    expect_user_to_be_signed_out
  end

  scenario "tries with blank password" do
    sign_up_with "testuser", "valid@example.com", ""

    expect_user_to_be_signed_out
  end
end
