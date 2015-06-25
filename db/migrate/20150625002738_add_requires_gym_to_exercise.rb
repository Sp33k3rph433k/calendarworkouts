class AddRequiresGymToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :requires_gym, :boolean
  end
end
