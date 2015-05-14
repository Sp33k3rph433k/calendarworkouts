class AddMuscleGroupIdToBodyParts < ActiveRecord::Migration
  def change
    add_reference :body_parts, :muscle_group, index: true
  end
end
