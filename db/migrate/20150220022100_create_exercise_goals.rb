class CreateExerciseGoals < ActiveRecord::Migration
  def change
    create_table :exercise_goals do |t|

      t.timestamps
    end
  end
end
