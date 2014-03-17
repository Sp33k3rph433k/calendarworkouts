class AddRepsSetsAndWeightToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :reps, :integer
    add_column :exercises, :sets, :integer
    add_column :exercises, :weight, :integer
  end
end
