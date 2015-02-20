class InitialQuestionnaire < ActiveRecord::Base
  accepts_nested_attributes_for :goal, :personal_detail, :schedule, :user

  belongs_to :user

end
