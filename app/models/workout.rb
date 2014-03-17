class Workout < ActiveRecord::Base
  has_many :exercises
  has_many :muscle_groups, through: :exercises
  belongs_to :user
  accepts_nested_attributes_for :exercises

  validates_presence_of :name



  private

  def detail_params
    params.require(:workout).permit(:name,
                                    :muscle_groups_attributes => [:id, :name,
                                    :exercises_attributes => [:id, :name, :sets, :reps, :weight, :time, :youtube_url]
    ])
  end
end
