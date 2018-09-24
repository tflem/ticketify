require "rails_helper"

RSpec.feature "Users can edit existing tickets" do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project) }
  let(:ticket) do
    FactoryBot.create(:ticket, project: project, user: user)
  end

  before do
    assign_role!(user, :editor, project)
    login_as(user)
    visit project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name",	with: "Make it respond faster!"
    click_button "Update Ticket"
    
    expect(page).to have_content "Ticket has been updated."

    within("#ticket h2") do
      expect(page).to have_content "Make it respond faster!"
      expect(page).not_to have_content ticket.name
    end
  end

  scenario "with invalid attributes" do
    fill_in "Name",	with: ""
    click_button "Update Ticket"
    
    expect(page).to have_content "Ticket has not been updated."
  end
end
      
