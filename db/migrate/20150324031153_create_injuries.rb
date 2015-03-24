class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|

      t.timestamps
    end
  end
end
