class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @personal_detail = @user.personal_detail
    @workout = @user.workouts
    @goals = @user.goals
  end

  def view_profile
    @user = current_user
    @personal_detail = @user.personal_detail
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      redirect_to user_dashboard_path
      flash[:notice] = "Updated your personal info!"
    else
      redirect_to :back
      flash[:notice] = "Couldn't save your info"
    end
  end

  def about_yourself
    @user = current_user
    @personal_detail = PersonalDetail.new
  end

  def check_for_injuries
    @user = current_user
    @injuries = Injury.new
    @body_part = BodyPart.new
  end

  def build_injuries


    if @user.update_attributes(user_params)
      redirect_to # next URL
      flash[:notice] = "We've recorded that information for later, we don't want you to get hurt!"
    else
      redirect_to :back
      flash[:notice] = "error in the users controller, build_injuries!"
    end
  end


  private

  def user_params
    params.require(:user).permit(:avatar, :age, :activity_level, personal_detail_attributes: [:id, :gender], injury_attributes: [:id, :body_part])
  end

end
