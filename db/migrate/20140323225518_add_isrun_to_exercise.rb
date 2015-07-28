class AddIsrunToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :cardio, :boolean
  end
end
