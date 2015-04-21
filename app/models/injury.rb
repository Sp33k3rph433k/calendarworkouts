class Injury < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :body_parts

  accepts_nested_attributes_for :body_parts

end
