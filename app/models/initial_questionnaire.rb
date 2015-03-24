class InitialQuestionnaire < ActiveRecord::Base
  serialize :injuries, Array

  GOAL_NAMES = ["Get stronger", "Get faster", "Slim down", "Lose baby weight", "Bulk Up", "Tone up", "Get started"]
  INJURED_BODY_PARTS = ["Arm", "Leg", "Back", "Wrist"]
  belongs_to :user
  has_many :goals
  has_one :personal_detail
  has_one :schedule

  accepts_nested_attributes_for :goals, :personal_detail, :schedule, :user
end
