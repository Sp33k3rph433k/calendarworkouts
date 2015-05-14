class MuscleGroup < ActiveRecord::Base
  belongs_to :exercise
  has_many :workouts, through: :exercises
  has_many :body_parts
end
