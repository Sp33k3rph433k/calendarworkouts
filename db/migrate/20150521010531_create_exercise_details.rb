class CreateExerciseDetails < ActiveRecord::Migration
  def change
    create_table :exercise_details do |t|

      t.timestamps
    end
  end
end
