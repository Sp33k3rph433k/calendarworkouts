class AddUserIdToInjury < ActiveRecord::Migration
  def change
    add_reference :injuries, :user, index: true
  end
end
