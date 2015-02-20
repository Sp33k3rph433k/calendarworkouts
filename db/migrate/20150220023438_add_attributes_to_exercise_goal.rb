class AddAttributesToExerciseGoal < ActiveRecord::Migration
  def change
    add_reference :exercise_goals, :exercise, index: true
    add_column :exercise_goals, :name, :string
  end
end
