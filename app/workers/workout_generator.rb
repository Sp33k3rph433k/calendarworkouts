class WorkoutGenerator
  @queue = :workout_queue

  def self.perform(initial_test_id)
    InitialTest.find(initial_test_id)

    # Take the data from the initial test and find workouts within the same tolerance

    Workout.where()
  end

end