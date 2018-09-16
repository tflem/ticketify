require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, name: "Visual Studio Code") }


  before do
    login_as(user)
    assign_role!(user, :viewer, project)
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

  scenario "when providing invalid atttributes" do
    fill_in "Name",	with: ""
    click_button "Update Project" 

    expect(page).to have_content "Project has not been updated."
  end
end