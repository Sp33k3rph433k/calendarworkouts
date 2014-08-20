class InitialTest::BuildController < ApplicationController
  include Wicked::Wizard

  steps :basic_bodyweight, :one_mile, :gym_maxes

  def show
    @user = current_user
    @initial_test = InitialTest.find(params[:initial_test_id])
    render_wizard
  end


  def update
    @initial_test = InitialTest.find(params[:initial_test_id])
    @initial_test.update_attributes(detail_params)
    render_wizard @initial_test
  end

  private
  def detail_params
    params.require(:initial_test).permit(:id, :pushups, :situps, :bodyweight_squats, :mile_run_time, :resting_heart_rate, :status)
  end

  def finish_wizard_path
    user_dashboard_path(current_user)
  end

end
