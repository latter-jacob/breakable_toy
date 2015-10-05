require 'rails_helper'

feature 'user updates a profile', %Q{
  As a user
  I want to be able to update my profile
} do

  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message

  scenario 'provide valid registration information' do
    user = FactoryGirl.create(:user, email: "john@example.com")
    visit new_user_session_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'

    visit edit_user_registration_path(user)

    fill_in 'Username', with: 'John'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Phone number', with: '5555555555'
    fill_in 'Emergency contact', with: 'Jane'
    fill_in 'Emergency contact email', with: 'jane@example.com'
    fill_in 'Emergency contact phone', with: '5555555555'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid update information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
