require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:user)}
  it { should have_many(:commits) }
  it { should have_many(:users).through(:commits) }

  it { should have_valid(:name).when("pick up hoops", "Tennis") }
  it { should_not have_valid(:name).when(nil) }

  it { should have_valid(:description).when("X" * 30) }

  it { should have_valid(:address).when("123 Example Ln") }
  it { should_not have_valid(:address).when(nil) }

  it { should have_valid(:city).when("NYC", "New York City", "boston") }
  it { should_not have_valid(:city).when(nil) }

  it { should have_valid(:zip).when("10011") }
  it { should_not have_valid(:zip).when(nil) }

  it { should have_valid(:loc).when("Intermediate", "Semi-Pro", "beginner") }
  it { should_not have_valid(:loc).when(nil) }

  it { should have_valid(:sport).when("Basketball", "Football") }
  it { should_not have_valid(:sport).when(nil) }
end
