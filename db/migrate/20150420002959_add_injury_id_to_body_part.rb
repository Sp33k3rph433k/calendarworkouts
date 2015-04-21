class AddInjuryIdToBodyPart < ActiveRecord::Migration
  def change
    add_reference :body_parts, :injury, index: true
  end
end
