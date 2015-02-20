class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|

      t.timestamps
    end
  end
end
