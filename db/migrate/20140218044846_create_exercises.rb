class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :youtube_url
      t.string :proper_form_text
      t.string :mini_image_url
      t.timestamps
    end
  end
end
