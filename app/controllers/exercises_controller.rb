class ExercisesController < ApplicationController

  def new
    @workout = Workout.new
    @exercise = Exercise.new
    @user = current_user
  end
end
