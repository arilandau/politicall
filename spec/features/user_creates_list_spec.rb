require 'rails_helper'

# [] User has to be signed in
# [] I should see a list of my lists

feature 'user creates their own lists' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list, user: user) }

  scenario 'A user sees their own lists' do
    visit new_user_session
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    visit new_user_list_path(user)

    expect(page).to have_content('List Name')
  end
end
