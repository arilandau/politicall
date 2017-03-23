require 'rails_helper'

describe List do
  it { should have_valid(:name).when('Congressmembers to Call') }
  it { should_not have_valid(:name).when('', nil) }
end
