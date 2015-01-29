class InitialTestController < ApplicationController

  def new
    @user = current_user
    @initial_test = InitialTest.new
    if @user.initial_test && !@user.initial_test.pushups.blank?
      redirect_to user_initial_test_build_path(@user.id, @user.initial_test, "one_mile")
    end
  end

  def create
    @initial_test = InitialTest.create(detail_params)
    if @initial_test.save
      redirect_to user_initial_test_build_path(current_user.id, @initial_test, "one_mile")
    else
      render :new
    end
  end

  private
  def detail_params
    params.require(:initial_test).permit(:id, :pushups, :situps, :bodyweight_squats, :mile_run_time, :resting_heart_rate, :user_id, :status)
  end
end
