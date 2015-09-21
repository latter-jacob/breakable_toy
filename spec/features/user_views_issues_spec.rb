require "rails_helper"

feature "user", %(
As a use, when I visit the root page
I want to see a list of issues to review.

  Acceptance Criteria
  [ ] - I must see the title of each review

) do

  scenario "user views all shows" do
    issue_1 = FactoryGirl.create(:issue)

    visit root_path

    expect(page).to have_content(issue_1.headline)
  end
end
