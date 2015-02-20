class Exercise < ActiveRecord::Base
  belongs_to :muscle_group
  belongs_to :workout
  has_many :exercise_sets
  has_many :exercise_body_parts
  has_many :exercise_goals

  validates_presence_of :name, :reps, :sets, :unless => :is_run


end
