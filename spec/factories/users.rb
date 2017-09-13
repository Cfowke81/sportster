FactoryGirl.define do
  factory :user do
    email "testuser1@yahoo.com"
    username "TeSTUser"
    first_name "Joe"
    last_name "Smith"
    password "Changeme"
  end
end
