require 'rails_helper'

feature 'user can submit a bike issue', %(
  As a user
   I want to be able to submit a bike issue

  Acceptance Criteria
  - [ ] I must be able to submit an issue

) do
  scenario 'submit bike issue' do
    visit new_issue_path

    fill_in 'issue[headline]', with: "I have a flat tire."
    fill_in 'issue[description]', with: "There is a nail in the front tire and I have a slow leak."

    click_button "Save Issue"

    expect(page).to have_content("I have a flat tire.")
    expect(page).to have_content("There is a nail in the front tire and I have a slow leak.")
  end
end
