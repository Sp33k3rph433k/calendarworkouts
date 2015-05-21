class ExerciseDetail < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  belongs_to :user
  belongs_to :initial_test

end
