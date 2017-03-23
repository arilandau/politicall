require 'rails_helper'

describe Congressmember do
  it { should have_valid(:first_name).when('Selena', 'Amy') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Meyer', 'Brookheimer') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('selenameyer2020@gmail.com', 'danistheworst@gmail.com') }
  it { should_not have_valid(:email).when('selenameyer2020', 'gmail.com') }

  it { should have_valid(:party).when('D', 'R', 'I') }
  it { should_not have_valid(:party).when('Democrat', 'Republican', 'Anarchist') }

  it { should have_valid(:chamber).when('Senate', 'House') }
  it { should_not have_valid(:chamber).when('', nil, 'New Jersey') }

  it { should have_valid(:url).when('http://www.selina-meyer-veep.com') }
  it { should_not have_valid(:party).when('http://www.selina-meyer-veep', '.com', '') }

  it { should have_valid(:next_election).when('2020', '2017') }
  it { should_not have_valid(:next_election).when('2016', '123', nil) }

  it { should have_valid(:phone_number).when('212-212-2122') }
  it { should_not have_valid(:phone_number).when('212', '212-212-21222') }

  it { should have_valid(:state).when('Pennsylvania', 'New Jersey') }
  it { should_not have_valid(:state).when('', nil) }

  it 'should have a unique email' do
    expect {
      FactoryGirl.create(
        :congressmember, email: 'lisasimpson202020@gmail.com', phone_number: '333-333-3333'
      )
    }.to_not raise_error
    expect {
      FactoryGirl.create(
        :congressmember, email: 'lisasimpson202020@gmail.com', phone_number: '333-333-4444'
      )
    }.to raise_error
  end

  it 'should have a unique url' do
    expect {
      FactoryGirl.create(
        :congressmember, phone_number: '222-222-3333', url: 'https://lisasimpson2020.com'
      )
    }.to_not raise_error
    expect {
      FactoryGirl.create(
        :congressmember, phone_number: '222-222-2222', url: 'https://lisasimpson2020.com'
      )
    }.to raise_error
  end

  it 'should have a unique phone_number' do
    expect {
      FactoryGirl.create(
        :congressmember, phone_number: '212-212-2122'
      )
    }.to_not raise_error
    expect {
      FactoryGirl.create(
        :congressmember, phone_number: '212-212-2122'
      )
    }.to raise_error
  end
end
