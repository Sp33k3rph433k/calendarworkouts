class AddUserRefToInitialTest < ActiveRecord::Migration
  def change
    add_reference :initial_tests, :user, index: true
  end
end
