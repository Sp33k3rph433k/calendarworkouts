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

    if @initial_test.save
      redirect_to user_initial_test_one_mile_form_path(current_user.id, @initial_test)
    else
      render :new
    end
  end

  def update
    @initial_test = InitialTest.find(params[:id])

    if detail_params["mile_run_time(4i)"] && detail_params["mile_run_time(5i)"] && !@initial_test.already_has_run?
      run_time = (detail_params["mile_run_time(4i)"].to_i * 60)+ detail_params["mile_run_time(5i)"].to_i
      @initial_test.exercise_details.create(exercise_id: Exercise.where(name: "one_mile_run").first.id, time: run_time, user_id: @initial_test.user_id)
    end
    binding.pry
    if !!try(:exercise_params)
      exercise_params.each {| exer, qty | @initial_test.exercise_details.create(exercise_id: Exercise.where(name: exer).first.id, reps: qty, time: qty, user_id: @initial_test.user_id) }
    end

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
    params.require(:exercises).permit(:pushups, :situps, :bodyweight_squats, :one_mile_run)
  end
end
