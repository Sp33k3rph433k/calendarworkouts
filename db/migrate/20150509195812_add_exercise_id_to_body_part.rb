class AddExerciseIdToBodyPart < ActiveRecord::Migration
  def change
    add_reference :body_parts, :exercises, index: true
  end
end
