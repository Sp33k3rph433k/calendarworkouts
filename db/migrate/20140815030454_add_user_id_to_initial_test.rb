class AddUserIdToInitialTest < ActiveRecord::Migration
  def change
    add_column :initial_tests, :user_id, :integer
    add_index :initial_tests, :user_id
  end
end
