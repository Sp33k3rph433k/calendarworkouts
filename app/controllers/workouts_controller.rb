class WorkoutsController < ApplicationController


  def new
    @workout = Workout.new
    @exercise = Exercise.new
    @user = current_user
  end

  def create
    @user = current_user
    @workout = @user.workouts.build(detail_params)

    if @workout.save
      flash[:notice] = "Workout created! Now tell us what exercises you did!"
      redirect_to new_workout_exercise_path(@workout)
    else
      flash[:notice] = "Error creating workout"
      redirect_to new_user_workout
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    Workout.find(params[:id]).destroy
    redirect_to user_dashboard_path
  end

  def edit
    @workout = Workout.find(params[:id])

    if @workout.save
      flash[:notice] = "Workout updated!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "Error updating this workout, email support@calendarworkouts.com"
      redirect_to user_dashboard_path
    end
  end


  private

  def detail_params
    params.require(:workout).permit(:name, :date)
  end
end
