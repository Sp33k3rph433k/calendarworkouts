class CreateBodyParts < ActiveRecord::Migration
  def change
    create_table :body_parts do |t|

      t.timestamps
    end
  end
end
