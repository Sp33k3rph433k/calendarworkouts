class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_one :workout, through: :exercise_details

  has_many :exercise_sets
  has_many :body_parts
  has_many :exercise_goals
  belongs_to :initial_test

  validates_presence_of :name, :reps, :sets, :unless => :is_run


end
