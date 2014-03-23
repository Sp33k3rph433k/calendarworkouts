class AddDateToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :date, :string
  end
end
