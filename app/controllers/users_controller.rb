class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    @personal_detail = current_user.personal_detail
  end

  def index
    @user = current_user
    @personal_detail = @user.personal_detail
    @workout = @user.workouts
  end

  def view_profile
    @user = current_user
    @personal_detail = @user.personal_detail
  end

  def update
    @user = current_user

    @user.update_attributes!(user_params)
    if @user.save
      flash[:notice] = "Photo updated!"
      redirect_to user_view_profile_path
    else
      flash[:notice] = "Couldn't save user information"
      redirect_to user_view_profile_path
    end
  end

  def about_yourself
    @user = current_user
    #
    # if @user.save
    #   redirect_to user_dashboard_path
    #   flash[:notice] = "Staying in shape is a way of life! Let's get started."
    # else
    #   redirect_to user_introduction_path
    #   flash[:notice] = "Couldn't save your info"
    # end
  end


  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
