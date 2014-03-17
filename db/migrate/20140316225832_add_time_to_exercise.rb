class AddTimeToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :time, :integer
  end
end
