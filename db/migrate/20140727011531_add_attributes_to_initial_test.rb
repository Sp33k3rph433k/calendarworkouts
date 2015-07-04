class AddAttributesToInitialTest < ActiveRecord::Migration
  def change
    add_column :initial_tests, :pushups, :integer
    add_column :initial_tests, :situps, :integer
    add_column :initial_tests, :body_weight_squats, :integer
    add_column :initial_tests, :mile_run_time, :time
    add_column :initial_tests, :resting_heart_rate, :integer
  end
end
