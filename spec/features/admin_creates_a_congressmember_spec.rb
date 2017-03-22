# require 'rails_helper'
#
# describe 'admin creates a new congressmember' do
#   scenario 'admin creates a new congressmember' do
#     admin = FactoryGirl.create(:user, role: 'admin')
#     congressmember = FactoryGirl.create(:congressmember)
#     visit new_user_session_path
#     fill_in 'Email', with: admin.email
#     fill_in 'Password', with: admin.password
#     click_button 'Submit'
#     visit new_congressmember_path
#     fill_in 'First name', with: congressmember.first_name
#     fill_in 'Middle name', with: congressmember.middle_name
#     fill_in 'Last name', with: congressmember.last_name
#     fill_in 'Next election', with: congressmember.next_election
#     fill_in 'Phone number', with: congressmember.phone_number
#     fill_in 'Email', with: congressmember.email
#     fill_in 'Url', with: congressmember.url
#     click_button 'Submit'
#
#     expect(page).to have_content(congressmember.first_name)
#     expect(page).to have_content(congressmember.last_name)
#     expect(page).to have_content('Alabama')
#   end
# end
