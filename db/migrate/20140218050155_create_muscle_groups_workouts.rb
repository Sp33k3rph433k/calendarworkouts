class CreateMuscleGroupsWorkouts < ActiveRecord::Migration
  def change
    create_table :muscle_groups_workouts , :id => false do |t|
      t.references :muscle_group
      t.references :workout
    end
  end
end
