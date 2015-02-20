class CreateInitialQuestionnaires < ActiveRecord::Migration
  def change
    create_table :initial_questionnaires do |t|

      t.timestamps
    end
  end
end
