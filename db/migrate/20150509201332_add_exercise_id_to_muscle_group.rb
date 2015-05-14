class AddExerciseIdToMuscleGroup < ActiveRecord::Migration
  def change
    add_reference :muscle_groups, :exercise, index: true
  end
end
