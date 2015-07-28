class WorkoutGenerator
  @queue = :workout_queue

  def self.perform(initial_test_id)
    initial_test_exercises = InitialTest.find(initial_test_id).exercises
    similar_exercise_array = initial_test_exercises.each


      # Take the data from the initial test and find workouts within the same tolerance

    Workout.where()
  end

end