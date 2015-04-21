class AddPartNameToBodyPart < ActiveRecord::Migration
  def change
    add_column :body_parts, :part_name, :string
  end
end
