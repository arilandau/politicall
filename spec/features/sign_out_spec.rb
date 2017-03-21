require 'rails_helper'

feature 'user signs out' do
  scenario 'user signs in and signs out' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end
end
