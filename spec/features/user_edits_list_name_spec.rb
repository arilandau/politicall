require 'rails_helper'

# [] User has to be signed in
# [] I should see a list of my lists

feature 'user edits a list name' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list, user: user) }

  scenario 'A user renames their list' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    visit new_user_list_path(user)
    fill_in 'Name', with: 'Old Name'
    click_button 'Submit'
    visit edit_list_path(list)
    fill_in 'Name', with: 'Nu Name'
    click_button 'Submit'

    expect(page).to have_content('Nu Name')
    expect(page).to have_content('List updated.')
    expect(page).to_not have_content('Old Name')
  end
end
