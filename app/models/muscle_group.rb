class MuscleGroup < ActiveRecord::Base
  belongs_to :exercise
  # has_many :workouts, through: :exercise_details TODO: I don't think this really makes sense in how it's structured now
  has_many :body_parts

end
