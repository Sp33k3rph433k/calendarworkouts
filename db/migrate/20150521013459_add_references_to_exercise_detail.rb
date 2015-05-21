class AddReferencesToExerciseDetail < ActiveRecord::Migration
  def change
    add_reference :exercise_details, :user, index: true
    add_reference :exercise_details, :workout, index: true
    add_reference :exercise_details, :exercise, index: true
  end
end
