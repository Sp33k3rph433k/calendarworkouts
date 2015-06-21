class ExercisesController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new
    @user = current_user
    @muscle_groups = MuscleGroup.all
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(detail_params)

    if @exercise.save
      flash[:notice] = "May I have another, SIR?!"
      redirect_to new_workout_exercise_path(@workout)
    else
      flash[:notice] = "Error creating workout"
      redirect_to user_dashboard_path
    end
  end

  def admin_create

  end


  private

  def detail_params
    params.require(:exercise).permit(:name, :youtube_url, :proper_form_text, :mini_image_url, :muscle_group, :reps, :sets, :weight, :time, :is_run)
  end

end
