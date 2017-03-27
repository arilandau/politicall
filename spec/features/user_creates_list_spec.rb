require 'rails_helper'

# [] User has to be signed in
# [] I should see a list of my lists

feature 'user creates their own lists' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:list) { FactoryGirl.create(:list, user: user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:list2) { FactoryGirl.create(:list, user: user2) }

  scenario 'A user names their list' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    visit new_user_list_path(user)
    fill_in 'Name', with: list.name
    click_button 'Submit'

    expect(page).to have_content(list.name)
    expect(page).to have_content('List added.')
  end

  scenario 'A user tries to save list without name' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    visit new_user_list_path(user)
    click_button 'Submit'

    expect(page).to_not have_content(list.name)
    expect(page).to_not have_content('List added.')
    expect(page).to have_content('Name can\'t be blank.')
  end

  scenario 'user can\'t see others\' lists' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    visit new_user_list_path(user)
    fill_in 'Name', with: list.name
    click_button 'Submit'

    expect(page).to_not have_content(list2.name)
  end
end
