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

  def secondary_muscle_group
    sorted_muscle_groups = muscle_groups.sort { |s| s.weighted_score }
    sorted_muscle_groups[1]
  end

  def similar_exercises(muscle_group)
    lower_bound = muscle_group.weighted_score - 15
    upper_bound = muscle_group.weighted_score + 15
    # MuscleGroup.where("body_parts LIKE ?", body_parts).where("weighted_score >= ? AND weighted_score <= ?", lower_bound, upper_bound).collect(&:exercise).compact!.uniq!  commenting this out in case I need it later
    MuscleGroup.joins(:body_parts).where(:body_parts => { part_name: muscle_group.body_parts.map(&:part_name) }).collect(&:exercise).compact!.uniq
  end



end
