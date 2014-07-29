class AddTestStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :test_status, :string
  end
end
