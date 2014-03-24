class AddDateToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :date, :time
  end
end
