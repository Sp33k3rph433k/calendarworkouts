class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    @personal_detail = current_user.personal_detail
  end

  def index
    @user = current_user
    @personal_detail = @user.personal_detail
  end
end
