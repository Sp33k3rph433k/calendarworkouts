class BodyPart < ActiveRecord::Base
  has_and_belongs_to_many :injuries
  belongs_to :exercise

  BODY_PART_NAMES = %w(back arms legs ankles wrists neck shoulders)


end
