require 'rails_helper'
# [x] I must specify valid information
# [x] If I do not perform valid information I get an error messages
# [x] I must specify a password and confirm that password

feature 'sign up' do
  scenario 'specifying a valid and required information' do
    visit new_user_registration_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Bart'
    fill_in 'Last Name', with: 'Simpson'
    fill_in 'Username', with: 'cowabunga'
    fill_in 'Email', with: 'bart@fartjoke.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Join'

    expect(page).to have_content('Successfully signed up.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Join'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password confirmation doesn\'t match password' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'bad_password'
    click_button 'Join'

    expect(page).to have_button('Join')
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content('Sign Out')
  end
end
