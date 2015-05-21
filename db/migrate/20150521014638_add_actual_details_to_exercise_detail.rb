class AddActualDetailsToExerciseDetail < ActiveRecord::Migration
  def change
    add_column :exercise_details, :reps, :integer
    add_column :exercise_details, :sets, :integer
    add_column :exercise_details, :weight, :integer
    add_column :exercise_details, :time, :integer
  end
end
