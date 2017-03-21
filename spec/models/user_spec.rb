require 'rails_helper'

describe User do
  it { should have_valid(:email).when('lisasimpson2020@gmail.com', 'cowabunga@gmail.com') }
  it { should_not have_valid(:email).when('lisasimpson2020', 'gmail.com') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'not_password'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
