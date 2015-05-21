class InitialTest < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, through: :exercise_details
  has_one :workout
  validates :pushups, :situps, :bodyweight_squats,      :presence => true, :if => :first_step_or_complete?
  validates :mile_run_time,                              :presence => true, if: :second_step_or_complete?
  validates :resting_heart_rate,                         presence: true, if: :complete?

  accepts_nested_attributes_for :exercises


  def complete?
    status == "complete"
  end

  def first_step_or_complete?
    status.include?("basic_bodyweight") || complete?
  end

  def second_step_or_complete?
    status.include?("one_mile") || complete?
  end

  def next_step
    case status
      when nil
        "basic_bodyweight"
      when "basic_bodyweight"
        "one_mile"
      when "one_mile"
        "gym_maxes"
    end
  end
  private


end
