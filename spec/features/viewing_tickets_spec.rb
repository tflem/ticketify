require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    vscode = FactoryBot.create(:project, name: "Visual Studio Code")
    FactoryBot.create(:ticket, project: vscode,
      name: "Add Moar Extensions!",
      description: "Linters! Languages! And moar!")

    op = FactoryBot.create(:project, name: "Opera Browser")
    FactoryBot.create(:ticket, project: op,
      name: "Standards compliance", description: "A force to be reckoned with.")

    visit "/"
  end

  scenario "for a given project" do
    click_link "Visual Studio Code"

    expect(page).to have_content "Add Moar Extensions!"
    expect(page).to_not have_content "Standards compliance"
    
    click_link "Add Moar Extensions"
    within("#ticket h2") do
      expect(page).to have_content "Add Moar Extensions"
    end
    
    expect(page).to have_content "Linters! Languages! And moar!"
  end
end
