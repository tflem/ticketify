require "rails_helper"

RSpec.feature "Admins can manager a user's roles" do 
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  let!(:op) { FactoryBot.create(:project, name: "Opera Browser") }
  let!(:vsc) { FactoryBot.create(:project, name: "Visual Studio Code") }

  before do 
    login_as(admin)
  end

  scenario "when assigning roles to an existing user" do
    visit admin_user_path(user)
    click_link "Edit User"

    select "Viewer", from: "Opera Browser"
    select "Manager", from: "Visual Studio Code"

    click_button "Update User"
    expect(page).to have_content "User has been updated."

    click_link user.email
    expect(page).to have_content "Opera Browser: Viewer"
    expect(page).to have_content "Visual Studio Code: Manager"
  end

  scenario "when assigning roles to a new user" do 
    visit new_admin_user_path

    fill_in "Email", with: "newuser@ticketify.com"
    fill_in "Password", with: "password"

    select "Editor", from: "Opera Browser"
    click_button "Create User"

    click_link "newuser@ticketify.com"
    expect(page).to have_content "Opera Browser: Editor"
    expect(page).not_to have_content "Visual Studio Code"
  end
end
