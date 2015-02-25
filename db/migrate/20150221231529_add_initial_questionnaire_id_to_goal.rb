class AddInitialQuestionnaireIdToGoal < ActiveRecord::Migration
  def change
    add_reference :goals, :initial_questionnaire, index: true
  end
end
