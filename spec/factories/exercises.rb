# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exercise do
    name "Ab Ripper"
    reps 10
    sets 3
    is_run false
    workout
  end
end