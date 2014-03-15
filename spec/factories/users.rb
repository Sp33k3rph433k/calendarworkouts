FactoryGirl.define do
  factory :user do
    name 'Cameron Kidman'
    email 'cameronjkidman@gmail.com'
    password 'test123!'
    password_confirmation 'test123!'
    zip '84057'
  end
end