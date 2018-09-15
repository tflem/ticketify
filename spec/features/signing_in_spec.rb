require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "with valid credentials" do
    visit "/"
    click_link "Login"
    fill_in "Email", with: user.email  
    fill_in "Password",	with: "password"
    click_button "Log In"
    
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{user.email}"
  end

  scenario "unless they are archived" do
    user.archive

    visit "/"
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log In"

    expect(page).to have_content "Your account has been archived."
  end
end 