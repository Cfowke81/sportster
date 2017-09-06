require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:events) }
  it { should have_many(:commits).through(:events) }

  it { should have_valid(:email).when("testuser@yahoo.com") }
  it { should_not have_valid(:email).when(nil, "testuser") }

  it { should have_valid(:username).when("sportuser79", "iLuvSoccer") }
  it { should_not have_valid(:username).when(nil) }

  it { should have_valid(:first_name).when("Steve", "amanda") }
  it { should_not have_valid(:first_name).when(nil) }

  it { should have_valid(:last_name).when("Smith", "seyfried") }
  it {should_not have_valid(:last_name).when(nil) }
end
