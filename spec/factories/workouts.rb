FactoryGirl.define do
  factory :workout do
    name "Ab day"
    date Date.today
    user
  end
end