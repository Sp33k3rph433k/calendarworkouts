class AddScoreToExerciseBodyPart < ActiveRecord::Migration
  def change
    add_column :exercise_body_parts, :score, :integer
  end
end
