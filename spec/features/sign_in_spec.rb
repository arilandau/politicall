require 'rails_helper'
# [] I must specify a valid email address
# [] I must specify a password and confirm that password
# [] If I do not perform the above I get an error messages
# [] If I input valid information, I register my account and get authenticated

feature 'sign up' do
  scenario 'specifying a valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Lisa'
    fill_in 'Last Name', with: 'Simpson'
    fill_in 'Email', with: 'lisasimpson2020@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content("You're in!")
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password confirmation doesn\'t match password' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'bad_password'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
