FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'test123!'
    password_confirmation 'test123!'
    zip { Faker::Address.zip }
  end
end