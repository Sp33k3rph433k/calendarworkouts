class AddStatusToInitialTest < ActiveRecord::Migration
  def change
    add_column :initial_tests, :status, :string
  end
end
