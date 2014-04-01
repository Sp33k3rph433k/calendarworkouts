class AddDateToPersonalDetail < ActiveRecord::Migration
  def change
    add_column :personal_details, :date, :date
  end
end
