class Exercise < ActiveRecord::Base
  belongs_to :muscle_group
  belongs_to :workout

  validates_presence_of :name, :youtube_url, :reps, :sets, :unless => :is_run?
  validates_presence_of :time if :is_run?

  #store accessors: [:is_run?]
  #
  #parse_as_booleans :is_run?

  private

  def detail_params
    params.require(:personal_detail).permit(:name, :youtube_url, :proper_form_text, :mini_image_url, :muscle_group, :reps, :sets, :weight, :time)
  end
end
