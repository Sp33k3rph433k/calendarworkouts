class InitialTest::BuildController < ApplicationController
  include Wicked::Wizard

  steps :basic_bodyweight, :one_mile, :gym_maxes

  def show
    @user = current_user
    @initial_test = @user.initial_test
    case step
      when :basic_bodyweight
        if !@initial_test.pushups.blank?
          next_step
        end
      when :one_mile
        if !@initial_test.mile_run_time.blank?
          next_step
        end
      when :gym_maxes

    end
    render_wizard
  end


  def update
    @initial_test = InitialTest.find(params[:initial_test_id])
    params[:initial_test][:status] = step.to_s
    params[:initial_test][:status] = 'complete' if step == steps.last
    @initial_test.update_attributes(detail_params)
    render_wizard @initial_test
    #todo -- consider redirecting to the user dashboard with a notice here.
  end

  private
  def detail_params
    params.require(:initial_test).permit(:id, :pushups, :situps, :bodyweight_squats, :mile_run_time, :resting_heart_rate, :status)
  end

  def finish_wizard_path
    user_dashboard_path(current_user)
  end

end
