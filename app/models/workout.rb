class Workout < ActiveRecord::Base
  has_many :exercises
  has_many :muscle_groups, through: :exercises
  has_many :exercise_goals, through: :exercises
  has_many :exercise_sets, through: :exercises
  has_many :exercise_body_parts, through: :exercises
  belongs_to :user
  belongs_to :initial_test
  accepts_nested_attributes_for :exercises

  validates_presence_of :name

  def build_initial_test_exercises

  end


  private

  def detail_params
    params.require(:workout).permit(:name, :date,
                                    :muscle_groups_attributes => [:id, :name,
                                    :exercises_attributes => [:id, :name, :sets, :reps, :weight, :time, :youtube_url]
    ])
  end
end
