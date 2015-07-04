class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_many :body_parts, through: :muscle_groups
  has_many :workouts, through: :exercise_details
  has_many :exercise_details

  # has_many :exercise_sets
  # has_many :exercise_goals TODO: Probably don't need this because I refactored how exercises work



  # validates_presence_of :name, :reps, :sets, :unless => :is_run
  def core_muscle_group
    muscle_groups.max_by(&:weighted_score)
  end

  def similar_exercises(weighted_score)
    lower_bound = weighted_score - 15
    upper_bound = weighted_score + 15
    MuscleGroup.where(name: name).where("weighted_score >= ? AND weighted_score <= ?", lower_bound, upper_bound).collect(&:exercise).compact!.uniq!
  end



end
