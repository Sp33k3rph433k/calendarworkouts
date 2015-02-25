class InitialQuestionnaire < ActiveRecord::Base


  belongs_to :user
  has_many :goals
  has_one :personal_detail
  has_one :schedule

  accepts_nested_attributes_for :goals, :personal_detail, :schedule, :user
end
