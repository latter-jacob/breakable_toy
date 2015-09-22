require 'rails_helper'

feature 'admin deletes an issue', %{
  As an admin
  I want to be able to delete an issue
} do

  # [ ] Admins are able to successfully delete a show

  scenario 'admin deletes issue successfully' do
    admin = FactoryGirl.create(:user, admin: true)
    issue = FactoryGirl.create(:issue)

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit issue_path(issue)

    click_link "Delete Issue"
    expect(page).to have_content("Issue deleted.")
    expect(page).not_to have_content("issue.headline")
  end

  scenario 'user can not delete issue successfully' do
    user = FactoryGirl.create(:user)
    issue = FactoryGirl.create(:issue)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')

    visit issue_path(issue)

    click_link "Delete Issue"
    expect(page).to have_content("Only admins can delete submissions!")
  end
end
