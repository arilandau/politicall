require 'rails_helper'

# [] User has to be signed in
# [] I should see a list of my lists

feature 'user creates their own lists' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list, user: user) }

  scenario 'A user sees their own lists' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    click_link 'Your Lists'

    expect(page).to have_content(list.name)
  end
end
