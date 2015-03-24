class Goal < ActiveRecord::Base

  GOAL_NAMES = ["Get stronger", "Get faster", "Slim down", "Lose baby weight", "Bulk Up", "Tone up", "Get started"]

  belongs_to :user

end
