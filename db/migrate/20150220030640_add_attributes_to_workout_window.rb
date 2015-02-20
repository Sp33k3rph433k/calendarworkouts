class AddAttributesToWorkoutWindow < ActiveRecord::Migration
  def change
    add_reference :workout_windows, :schedule, index: true
    add_column :workout_windows, :day_of_week, :integer
    add_column :workout_windows, :start_time, :time
    add_column :workout_windows, :end_time, :time
  end
end
