class SchedulesController < ApplicationController

  def create
    all_workouts = params[:schedule]
    all_workouts.each {|f| WorkoutWindow.create(all_workouts.each {|f| WorkoutWindow.create(start_time: f["start_time"], end_time: f["end_time"], day_of_week: f["name"], schedule_id: current_user.schedule.id)})}
    binding.pry
  end

  def new
    @user = current_user
    @schedule = @user.schedule
  end

  private

  def schedule_params
      params.require(:schedule).permit(:name, :initial_questionnaire_id, workout_window_attributes: [:id, :day_of_week, :start_time, :end_time] )
  end
end
