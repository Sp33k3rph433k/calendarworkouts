FactoryGirl.define do
  factory :exercise_detail do
    exercise
    workout
    user
    sets 3
    reps 15
    time "7:00"
    weight 0
  end

end
