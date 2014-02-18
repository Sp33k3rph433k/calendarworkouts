class CreateMuscleGroups < ActiveRecord::Migration
  def change
    create_table :muscle_groups do |t|
      t.string :name
      t.belongs_to :exercise

      t.timestamps
    end
  end
end
