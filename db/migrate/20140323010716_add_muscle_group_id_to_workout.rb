class AddMuscleGroupIdToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :muscle_group_id, :integer
  end
end
