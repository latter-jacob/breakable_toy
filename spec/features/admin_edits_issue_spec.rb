require 'rails_helper'

feature 'admin edits issue', %{
  As an admin
  I want to be able to edit an issue
   [X] Admins are able to visit the edit issue page
   [X] Non admins are redirected when attempting to visit the page
   [X] Admins are able to successfully edit a show
   [X] With invalid form info, admins are not able to edit a new show
} do

  scenario 'admin edits issue successfully' do
    admin = FactoryGirl.create(:user, admin: true)
    issue = FactoryGirl.create(:issue)

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit edit_issue_path(issue)

    fill_in 'Headline', with: "Handlebars broke"

    click_button "Edit Issue"

    expect(page).to have_content('Handlebars broke')
    expect(page).to have_content('Issue Edited')
  end

  scenario 'admin edits issue unsuccessfully' do
    admin = FactoryGirl.create(:user, admin: true)
    issue = FactoryGirl.create(:issue)

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit edit_issue_path(issue)

    fill_in 'Headline', with: ""

    click_button "Edit Issue"

    expect(page).to have_content("Headline can't be blank")
  end

  scenario 'user tries to visit edit issue page' do
    user = FactoryGirl.create(:user)
    issue = FactoryGirl.create(:issue)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit edit_issue_path(issue)

    expect(page).to have_content("This portion of the site is for admins only!")
  end

  scenario 'admin is able to navigate to edit page from show page' do
    admin = FactoryGirl.create(:user, admin: true)
    issue = FactoryGirl.create(:issue)

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit issue_path(issue)

    click_link('Edit')

    expect(page).to have_content("Edit #{issue.headline}")
  end
end
