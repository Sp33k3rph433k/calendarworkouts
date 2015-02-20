class AddAttributesToExerciseBodyPart < ActiveRecord::Migration
  def change
    add_reference :exercise_body_parts, :exercise, index: true
    add_column :exercise_body_parts, :name, :string
  end
end
