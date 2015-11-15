class Api::V1::UsersController < ::Api::V1::ApiController
  respond_to :json

  def create
    if User.create(user_params)
      head 201
    else
      head 422
    end
  end

  def dashboard
    @user = User.find(params[:user_id])
    render json: @user, status: 200, location: [:api, @user]
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_id, :password, :password_confirmation, :name)
  end
end
