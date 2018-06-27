require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryBot.create(:project, name: "Visual Studio Code")

    visit "/"
    click_link "Visual Studio Code"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Name",	with: "Visual Studio"
    click_button "Update Project"
    
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Visual Studio"
  end
end