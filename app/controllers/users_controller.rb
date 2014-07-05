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

  def edit_profile
    @user = current_user
  end

  def update
    @user = current_user

    @user.update_attributes!(user_params)
    if @user.save
      flash[:notice] = "Photo updated!"
      redirect_to user_edit_profile_path
    else
      flash[:notice] = "Couldn't save user information"
      redirect_to user_edit_profile_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
