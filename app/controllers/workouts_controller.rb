class WorkoutsController < ApplicationController


  def new
    @workout = Workout.new
    @exercise = Exercise.new
    @user = current_user
    @muscle_groups = MuscleGroup.all
  end

  def create
    @workout = Workout.new(params[:workout])

    if @workout.save
      flash[:notice] = "Workout created! Now tell us what exercises you did!"
      redirect_to new_workout_exercise_path
    else
      flash[:notice] = "Error creating workout"
      redirect_to new_user_workout
    end
  end


end
