require 'rails_helper'

describe 'admin deletes congressmember' do
  it 'admin can see delete button' do
    admin = FactoryGirl.create(:user, role: "admin")
    congressmember = FactoryGirl.create(:congressmember)
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Submit'
    visit congressmember_path(congressmember)

    expect(page).to have_link('Delete')
  end

  it 'user can\'t see delete button' do
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
    click_link 'Delete'

    expect(page).to have_content('Congressmember deleted!')
    expect(page).to_not have_content(congressmember.first_name)
    expect(page).to_not have_content(congressmember.last_name)
  end
end
