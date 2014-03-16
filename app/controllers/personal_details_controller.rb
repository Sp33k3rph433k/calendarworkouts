class PersonalDetailsController < ApplicationController

  def new
    @user = current_user
    @personal_detail = PersonalDetail.new
  end


  def create
    @user = current_user
    @personal_detail = @user.build_personal_detail(detail_params)

    if @personal_detail.save
      flash[:notice] = "Thanks for checking in! We'll track your progress"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "There was an error saving your info"
      render :action => :new
    end
  end

  def show
    @user = current_user
    @personal_detail = @user.personal_detail
  end

  def edit
    @user = current_user
    @personal_detail = @user.personal_detail
  end

  def update
    @user = current_user
    @personal_detail = @user.personal_detail
    if @personal_detail.update_attributes(detail_params)
      flash[:notice] = "Check-in any time you'd like!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "There was a problem checking in"
      redirect_to edit_user_personal_detail_path
    end
  end



  private

  def detail_params
    params.require(:personal_detail).permit(:gender, :weight, :bicep, :shoulders, :chest, :neck, :waist, :hips, :thigh, :resting_heart_rate, :calf, :submit)
  end
end
