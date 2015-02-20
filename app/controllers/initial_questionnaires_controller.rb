class InitialQuestionnairesController < ApplicationController
  def new
    @initial_questionnaire = InitialQuestionnaire.new
  end

  def create

  end

  private

  def initial_questionnaire_params
    params.require(:initial_questionnaire).permit( goal_attributes:[:name], personal_detail_attributes:[:name])
  end
end
