class InitialTest < ActiveRecord::Base
  belongs_to :user
  validates :pushups, :situps, :bodyweight_squats,      :presence => true, :if => :first_step_or_complete?
  validates :mile_run_time,                              :presence => true, if: :second_step_or_complete?
  validates :resting_heart_rate,                         presence: true, if: :complete?


  def complete?
    status == "complete"
  end

  def first_step_or_complete?
    status.include?("basic_bodyweight") || complete?
  end

  def second_step_or_complete?
    status.include?("one_mile") || complete?
  end
  private

  def detail_params
    params.require(:workout).permit(:name, :date)
  end

end
