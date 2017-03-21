require 'rails_helper'
# [] I must provide valid information
# [] I should see an error message if I enter an invalid email
# [] I should see an error message if I enter an invalid password

feature 'user signs in' do
  scenario 'user successfully signs in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Sign Up')
    expect(page).to have_content('Sign Out')
  end

  scenario 'user provides incorrect email' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrongemail@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'

    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to have_content('Sign In')
  end

  scenario 'user provides incorrect password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'notmypassword'
    click_button 'Submit'

    expect(page).to have_content("Sign In")
    expect(page).to_not have_content('Signed in successfully.')
  end
end
