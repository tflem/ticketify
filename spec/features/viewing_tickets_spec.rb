require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    user = FactoryBot.create(:user)


    vscode = FactoryBot.create(:project, name: "Visual Studio Code")
    assign_role!(user, :viewer, vscode)
    FactoryBot.create(:ticket, project: vscode,
      user: user, name: "Add Moar Extensions!",
      description: "Linters! Languages! And moar!")

    op = FactoryBot.create(:project, name: "Opera Browser")
    assign_role!(user, :viewer, op)
    FactoryBot.create(:ticket, project: op, user: user,
      name: "Standards compliance", description: "A force to be reckoned with.")

    login_as(user)
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
