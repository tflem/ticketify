require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email",	with: "pstar@bb.com"
    fill_in "user_password",	with: "password"
    fill_in "Password confirmation",	with: "password"
    click_button "Sign Up"
    expect(page).to have_content("You have signed up successfully.")
  end
end     