class InitialTest < ActiveRecord::Base
  belongs_to :user

  def complete?
    status == "complete"
  end

  private

  def detail_params
    params.require(:workout).permit(:name, :date)
  end

end
