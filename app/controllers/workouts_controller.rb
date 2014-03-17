class WorkoutsController < ApplicationController


  def new
    @workout = Workout.new
    @exercise = Exercise.new
    @user = current_user
  end

  def create
    @workout = Workout.new(params[:workout])

    if @workout.save
      flash[:notice] = "Workout created!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "Error creating workout"
      redirect_to new_user_workout
    end
  end


end
