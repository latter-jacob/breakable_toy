require "rails_helper"

feature "user", %(
As a user, when I visit the show page
i want to see the details for the specified issue
  Acceptance Criteria
  [ ] - I must see details of issue
) do
  scenario "user views details of issue" do
    issue_1 = FactoryGirl.create(:issue)

    visit issue_path(issue_1.id)

    expect(page).to have_content(issue_1.headline)
    expect(page).to have_content(issue_1.description)
  end
end
