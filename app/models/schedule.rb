class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :workout_windows
  belongs_to :initial_questionnaire

  accepts_nested_attributes_for :workout_windows
end
