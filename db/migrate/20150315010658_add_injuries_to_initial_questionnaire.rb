class AddInjuriesToInitialQuestionnaire < ActiveRecord::Migration
  def change
    add_column :initial_questionnaires, :injuries, :string
  end
end
