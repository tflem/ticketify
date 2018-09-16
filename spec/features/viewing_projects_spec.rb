require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, name: "Visual Studio Code") }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
  end

  scenario "with project details" do
    visit "/"
    click_link "Visual Studio Code"
    expect(page.current_url).to eq project_url(project)
  end
end  