class InitialTestController < ApplicationController

  def new
    @user = current_user
    @initial_test = InitialTest.new
    if @user.initial_test && !@user.initial_test.pushups.blank?
      redirect_to user_initial_test_build_path(@user.id, @user.initial_test, "one_mile")
    end
  end

  def create
    @user = current_user
    @initial_test = @user.create_initial_test(detail_params)
    exercise_params.each {| exer, qty | @initial_test.exercise_details.create(exercise_id: Exercise.where(name: exer).first.id, reps: qty, user_id: @initial_test.user_id) }

    # we need to create a workout
    binding.pry
    # We need to give 3 exercises to those workouts
    if @initial_test.save
      redirect_to user_initial_test_build_path(current_user.id, @initial_test, "one_mile")
    else
      render :new
    end
  end

  def update
    @initial_test = InitialTest.find(params[:initial_test_id])
    if @initial_test.save
      flash[:notice] = "Updated!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "There was an error, try again please!"
      redirect_to :back
    end
  end

  def one_mile_form
    @user = current_user
    @initial_test = InitialTest.find(params[:initial_test_id])
  end

  private
  def detail_params
    params.require(:initial_test).permit(:id, :pushups, :situps, :bodyweight_squats, :mile_run_time, :resting_heart_rate, :user_id, :status, :exercises => [])
  end

  def exercise_params
    params.require(:exercises).permit(:pushups, :situps, :bodyweight_squats)
  end
end
