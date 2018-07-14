require "rails_helper"

RSpec.feature "Users can create tickets" do
        let(:user) { FactoryBot.create(:user) }
  before do
    login_as(user)
    project = FactoryBot.create(:project, name: "Opera Browser")

    visit project_path(project)
    click_link "New Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name",	with: "Non-standards compliance"
    fill_in "Description",	with: "My pages are awful."
    click_button "Create Ticket"    

    expect(page).to have_content "Ticket has been created."
    within("#ticket") do
      expect(page).to have_content "User: #{user.email}"
    end
  end
    
    scenario "when providing invalid attributes" do
      click_button "Create Ticket"

      expect(page).to have_content "Ticket has not been created."
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Description can't be blank"
    end

    scenario "with an invalid description" do
      fill_in "Name",	with: "Non-standard compliance"
      fill_in "Description",	with: "Too slow"
      click_button "Create Ticket"
      
      expect(page).to have_content "Ticket has not been created."
      expect(page).to have_content "Description is too short"
    end
  end