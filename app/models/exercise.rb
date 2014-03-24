class Exercise < ActiveRecord::Base
  belongs_to :muscle_group
  belongs_to :workout

  validates_presence_of :name, :reps, :sets, :unless => :is_run


end
