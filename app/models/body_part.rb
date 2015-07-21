class BodyPart < ActiveRecord::Base
  has_and_belongs_to_many :injuries
  belongs_to :exercise
  belongs_to :muscle_group

  BODY_PART_NAMES = %w(Lower_Back Arms Legs Ankles Wrists Neck Shoulders Core Feet Hips Butt Chest Upper_Back)


end
