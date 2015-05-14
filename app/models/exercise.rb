class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  belongs_to :workout
  has_many :exercise_sets
  has_many :body_parts
  has_many :exercise_goals

  validates_presence_of :name, :reps, :sets, :unless => :is_run


end
