class SchedulesController < ApplicationController

  def create
    all_workouts = params[:schedule]
    binding.pry
  end

  private

  def schedule_params
      params.require(:schedule).permit(:name, :initial_questionnaire_id, workout_window_attributes: [:id, :day_of_week, :start_time, :end_time] )
  end
end
