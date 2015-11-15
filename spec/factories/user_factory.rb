FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password "Test123!"
    password_confirmation "Test123!"
  end
end
