class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_many :body_parts, through: :muscle_groups
  has_many :workouts, through: :exercise_details
  has_many :exercise_details

  # has_many :exercise_sets
  # has_many :exercise_goals TODO: Probably don't need this because I refactored how exercises work



  # validates_presence_of :name, :reps, :sets, :unless => :is_run


end
