class AddIsrunToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :is_run, :boolean
  end
end
