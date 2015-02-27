class InitialQuestionnairesController < ApplicationController
  def new
    @user = current_user
    @initial_questionnaire = InitialQuestionnaire.new
    @initial_questionnaire.schedule = Schedule.new
    @initial_questionnaire.personal_detail = PersonalDetail.new
    @initial_questionnaire.goals.build
  end

  def create
    binding.pry
    @initial_questionnaire = InitialQuestionnaire.create(initial_questionnaire_params)
    if @initial_questionnaire.save
      redirect_to user_dashboard_path(@user)
      flash[:notice] = "Sweet! Nested Attributes works!"
    end
  end

  private

  def initial_questionnaire_params
    params.require(:initial_questionnaire).permit( goals_attributes:[:id, :name, :initial_questionnaire_id], personal_detail_attributes:[:id, :name, :chest, :initial_questionnaire_id], schedule_attributes: [:id, :name, :initial_questionnaire_id])
  end
end
