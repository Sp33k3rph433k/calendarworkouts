class AddInitialTestToExerciseDetail < ActiveRecord::Migration
  def change
    add_reference :exercise_details, :initial_test, index: true
  end
end
