class GoalsController < ApplicationController

  def new
    @user = current_user
    @goals = Goal.new
    @all_goals = Goal.all
  end

end
