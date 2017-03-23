require 'rails_helper'

describe 'User deletes account' do
  scenario 'user hits delete' do
    visit new_user_registration_path
    fill_in 'First Name', with: 'Bart'
    fill_in 'Last Name', with: 'Simpson'
    fill_in 'Username', with: 'cowabunga'
    fill_in 'Email', with: 'bart@fartjoke.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Join'
    click_link 'Your Account'
    fill_in 'Current Password', with: 'password'
    click_button 'Cancel my account'

    expect(page).to have_content('Bye')
    expect(page).to_not have_content('Your Account')
    expect(page).to_not have_content('Sign Out')
  end
end
