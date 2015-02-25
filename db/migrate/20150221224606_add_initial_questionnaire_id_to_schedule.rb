class AddInitialQuestionnaireIdToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedules, :initial_questionnaire, index: true
  end
end
