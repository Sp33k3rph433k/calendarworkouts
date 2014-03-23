class ExercisesController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new
    @user = current_user
  end

  def create

  end
end
