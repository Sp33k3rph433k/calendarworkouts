class GoalsController < ApplicationController

  def new
    @user = current_user
    @goals = @user.goals.build
  end

  def create
    user = User.find_by_id(params[:user_id])
    goal_names = params[:goal][:name]
    goal_names.each {|user_goals| user.goals.create(name: user_goals)}
    # TODO need to add something that validates whether or not these saved.
    flash[:notice] = "Successfully saved your goals!"
    redirect_to user_dashboard_path
  end

  private

  def goal_params
    params.require(:goals).permit(:name, :user_id)
  end


end
