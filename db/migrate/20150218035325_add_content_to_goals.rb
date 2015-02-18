class AddContentToGoals < ActiveRecord::Migration
  def change
    add_reference :goals, :user, index: true
    add_column :goals, :name, :string
    add_column :goals, :how_text, :string
    add_column :goals, :image_url, :string
  end
end
