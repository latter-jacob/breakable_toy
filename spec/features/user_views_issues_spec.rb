require "rails_helper"

feature "user", %(
As a use, when I visit the root page
I want to see a list of issues

  Acceptance Criteria
  [ ] - I must see the headline of each issue
) do
  scenario "user views all issues" do
    issue_1 = FactoryGirl.create(:issue)

    visit root_path

    expect(page).to have_content(issue_1.headline)
  end
end
