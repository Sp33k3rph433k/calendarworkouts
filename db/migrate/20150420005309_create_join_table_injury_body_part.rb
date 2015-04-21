class CreateJoinTableInjuryBodyPart < ActiveRecord::Migration
  def change
    create_join_table :injuries, :body_parts do |t|
      # t.index [:injury_id, :body_part_id]
      # t.index [:body_part_id, :injury_id]
    end
  end
end
