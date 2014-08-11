class InitialTest < ActiveRecord::Base
  belongs_to :user


  # validates :basic_bodyweight,      :presence => true, :if => :active_or_basic_bodyweight?
  # validates :one_mile,              :presence => true, :if => :active_or_one_mile?
  # validates :gym_maxes,             :presence => true, :if => :active_or_gym_maxes?
  #
  # def active?
  #   status == 'active'
  # end
  #
  # def active_or_basic_bodyweight?
  #   status.include?('basic_bodyweight') || active?
  # end
  #
  # def active_or_one_mile?
  #   status.include?('one_mile') || active?
  # end
  #
  # def active_or_gym_maxes?
  #   status.include?('gym_maxes') || active?
  # end
  #
  # def complete?
  #   status == "complete"
  # end

  private

  def detail_params
    params.require(:workout).permit(:name, :date)
  end

end
