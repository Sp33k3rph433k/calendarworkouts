class MuscleGroup < ActiveRecord::Base

  DEFAULT_GROUPS = ["Abdominal", "Biceps", "Deltoids", "Erector Spinae", "Gastrocnemius and Soleus", "Gluteus", "Hamstrings", "Latissimus Dorsi", "Rhomboids", "Obliques", "Pectoralis", "Quadriceps", "Trapezius", "Triceps"]

  belongs_to :exercise
  # has_many :workouts, through: :exercise_details TODO: I don't think this really makes sense in how it's structured now
  has_many :body_parts

end
