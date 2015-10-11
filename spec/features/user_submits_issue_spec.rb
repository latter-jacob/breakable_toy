require 'rails_helper'

feature 'user can submit a bike issue', %(
  As a user
   I want to be able to submit a bike issue

  Acceptance Criteria
  - [X] User must be able to submit an issue
  - [X] User get error messages when filling out form wrong

) do
  scenario 'user submits bike issue with success' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')

    visit new_issue_path

    fill_in 'issue[headline]', with: "Issue Successfully Added!"


    click_button "Add Issue"

    expect(page).to have_content("Issue Successfully Added!")
  end
  scenario 'user adds issue unsuccessfully' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')

    visit new_issue_path

    click_button "Add Issue"

    expect(page).to have_content("Headline can't be blank")
  end
end
