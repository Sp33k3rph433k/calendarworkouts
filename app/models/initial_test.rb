class InitialTest < ActiveRecord::Base
  belongs_to :user
  has_many :exercise_details
  has_many :exercises, through: :exercise_details
  has_one :workout
  # validates :pushups, :situps, :bodyweight_squats,      :presence => true, :if => :first_step_or_complete?
  # validates :mile_run_time,                              :presence => true, if: :second_step_or_complete?
  # validates :resting_heart_rate,                         presence: true, if: :complete?

  # after_create :spin_up_initial_exercises

  has_paper_trail

  accepts_nested_attributes_for :exercises


  def complete?
    status == "complete"
  end

  def exercise_array
    %w(pushups situps bodyweight_squats)
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

  def already_has_run?
    !exercises.where(name: "one_mile_run").blank?
  end
  private

  # def spin_up_initial_exercises #maybe not do this on an after_create?
  #   exercise_array.each do |exercise|
  #
  #   end
  #   # self.exercise_details.find_or_create_by(exercise_id: Exercise.find_by_name("pushups").id, user_id: user_id)
  #   # self.exercise_details.find_or_create_by(exercise_id: Exercise.find_by_name("situps").id, user_id: user_id)
  #   # self.exercise_details.find_or_create_by(exercise_id: Exercise.find_by_name("bodyweight_squats").id, user_id: user_id)
  # end

end
