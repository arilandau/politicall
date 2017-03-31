require 'rails_helper'

# As a user that cares about politics
# I should be able to see all the information about that congressmember
# So that I can know more about it

# [X] I don't have to be signed in
# [X] I should see details for the individual congressmember
# [X] I should be able to click link to go to congressmember's website

feature 'visitor sees details for individual congressmember' do
  scenario 'sees full information for specific congressmember' do
    congressmember = FactoryGirl.create(:congressmember)
    visit congressmember_path(congressmember)

    expect(page).to have_content congressmember.first_name
    expect(page).to have_content congressmember.middle_name
    expect(page).to have_content congressmember.last_name
    expect(page).to have_content congressmember.party
    expect(page).to have_content congressmember.state
    expect(page).to have_content congressmember.chamber.upcase
    expect(page).to have_content congressmember.leadership_role
    expect(page).to have_content congressmember.next_election
    expect(page).to have_content congressmember.twitter_account
    expect(page).to have_link congressmember.twitter_account
    expect(page).to have_content congressmember.facebook_account
    expect(page).to have_link congressmember.facebook_account
    expect(page).to have_content congressmember.phone
    expect(page).to have_link congressmember.email
    expect(page).to have_link("Website")
  end
end
