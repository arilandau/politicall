require 'rails_helper'

describe 'admin edits congressmember' do
  it 'admin can see edit button' do
    admin = FactoryGirl.create(:user, role: 'admin')
    congressmember = FactoryGirl.create(:congressmember)
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Submit'
    visit congressmember_path(congressmember)

    expect(page).to have_content('Edit')
  end

  it 'user can\'t see edit button' do
    user = FactoryGirl.create(:user)
    congressmember = FactoryGirl.create(:congressmember)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Submit'
    visit congressmember_path(congressmember)

    expect(page).to_not have_link('Delete')
  end

  it 'admin actually edits congressmember' do
    admin = FactoryGirl.create(:user, role: 'admin')
    congressmember = FactoryGirl.create(:congressmember)
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Submit'
    visit congressmember_path(congressmember)
    click_link 'Edit'
    fill_in 'First Name', with: 'Arielle'
    click_button 'Submit'

    expect(page).to have_content('Congressmember updated!')
    expect(page).to have_content('Arielle')
  end
end
