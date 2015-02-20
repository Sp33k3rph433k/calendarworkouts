class AddAttributesToExerciseSet < ActiveRecord::Migration
  def change
    add_reference :exercise_sets, :exercise, index: true
    add_column :exercise_sets, :reps, :integer
    add_column :exercise_sets, :weight, :integer
    add_column :exercise_sets, :rest_time, :integer
  end
end
