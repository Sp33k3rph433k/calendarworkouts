class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  belongs_to :workout
end
