FactoryGirl.define do
  factory :exercise_detail do
    sets 3
    reps 15
    time "7:00"
    weight 0
    user
    exercise
  end

end
