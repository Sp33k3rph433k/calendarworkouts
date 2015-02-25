class AddInitialQuestionnaireIdToPersonalDetail < ActiveRecord::Migration
  def change
    add_reference :personal_details, :initial_questionnaire, index: true
  end
end
