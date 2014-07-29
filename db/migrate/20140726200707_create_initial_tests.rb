class CreateInitialTests < ActiveRecord::Migration
  def change
    create_table :initial_tests do |t|

      t.timestamps
    end
  end
end
