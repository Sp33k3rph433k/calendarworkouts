class AddInitialTestToWorkout < ActiveRecord::Migration
  def change
    add_reference :workouts, :initial_test, index: true
  end
end
