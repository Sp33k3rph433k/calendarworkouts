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

  def admin_form
    @exercise = Exercise.new
    @muscle_groups = MuscleGroup::DEFAULT_GROUPS
    @user = current_user
  end

  def admin_create
    @exercise = Exercise.new(detail_params)

    if @exercise.save
      params[:muscle_groups].each { |muscle_group| @exercise.muscle_groups.create(muscle_group) }
      flash[:notice] = "Exercise saved in the database!"
      redirect_to user_dashboard_path(@user)
    else
      flash[:notice] = "Error saving exercise, try again"
      redirect_to :back
    end
  end


  private

  def detail_params
    params.require(:exercise).permit(:name, :youtube_url, :proper_form_text, :mini_image_url, :muscle_group, :reps, :sets, :weight, :time, :cardio, :requires_gym, :muscle_groups => [])
  end

end
