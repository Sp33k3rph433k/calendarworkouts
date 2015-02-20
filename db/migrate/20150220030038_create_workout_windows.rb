class CreateWorkoutWindows < ActiveRecord::Migration
  def change
    create_table :workout_windows do |t|

      t.timestamps
    end
  end
end
