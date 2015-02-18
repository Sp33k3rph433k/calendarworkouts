class GoalsController < ApplicationController

  def new
    @user = current_user
    @goals = Goals.new
  end

end
