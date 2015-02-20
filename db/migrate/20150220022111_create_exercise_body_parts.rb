class CreateExerciseBodyParts < ActiveRecord::Migration
  def change
    create_table :exercise_body_parts do |t|

      t.timestamps
    end
  end
end
