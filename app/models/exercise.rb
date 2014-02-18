class Exercise < ActiveRecord::Base
  belongs_to :muscle_group
  belongs_to :workout
end
