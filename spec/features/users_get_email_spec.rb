require 'rails_helper'

feature 'all users get email from ', %{

} do

  scenario "user submits an issue" do
    user = FactoryGirl.create(:user, email: "email@email.com")

    visit new_user_session_path

    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'

    visit new_issue_path

    fill_in 'issue[headline]', with: "Tire is flat."

    click_button "Add Issue"

    expect(page).to have_content("Tire is flat.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
