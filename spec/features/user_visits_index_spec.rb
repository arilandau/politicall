require 'rails_helper'

# [X] I don't have to be signed in
# [X] I should see details for the individual congressmember
# [X] I should be able to go to the congressmember's showpage if I click on it

feature 'visitor sees list of all Congressmembers' do
  scenario 'sees full list' do
    congress1 = FactoryGirl.create(:congressmember, phone: '333-333-3333')
    congress2 = FactoryGirl.create(:congressmember, phone: '444-333-3333')
    congress3 = FactoryGirl.create(:congressmember, phone: '555-333-3333')
    congress4 = FactoryGirl.create(:congressmember, phone: '666-333-3333')
    visit root_path

    expect(page).to have_content congress1.first_name
    expect(page).to have_content congress1.last_name
    expect(page).to have_content congress1.party
    expect(page).to have_content congress1.state

    expect(page).to have_content congress2.first_name
    expect(page).to have_content congress2.last_name
    expect(page).to have_content congress2.party
    expect(page).to have_content congress2.state

    expect(page).to have_content congress3.first_name
    expect(page).to have_content congress3.last_name
    expect(page).to have_content congress3.party
    expect(page).to have_content congress3.state

    expect(page).to have_content congress4.first_name
    expect(page).to have_content congress4.last_name
    expect(page).to have_content congress4.party
    expect(page).to have_content congress4.state
  end

  scenario 'clicks on card to see showpage' do
    congress1 = FactoryGirl.create(:congressmember)
    visit root_path
    click_link 'Selina Meyer'

    expect(page).to have_content congress1.next_election
  end
end
