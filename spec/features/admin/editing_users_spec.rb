require "rails_helper"

RSpec.feature "Admins can change a user's details" do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link "Edit User"
  end

  scenario "with valid details" do
    fill_in "Email", with: "newb@ticketify.com"
    click_button "Update User"

    expect(page).to have_content "User has been updated."
    expect(page).to have_content "newb@ticketify.com"
    expect(page).to_not have_content user.email
  end

  scenario "with invalid details" do
    fill_in "Email", with: ""
    fill_in "Password", with: "password"
    click_button "Update User"

    expect(page).to have_content "User has not been updated."
  end

  scenario "when toggling a user's admin ability" do
    check "Admin"
    click_button "Update User"

    expect(page).to have_content "User has been updated."
    expect(page).to have_content "#{user.email} (Admin)"
  end
end