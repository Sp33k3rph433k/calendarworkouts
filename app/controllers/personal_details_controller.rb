class PersonalDetailsController < ApplicationController

  def new
    @user = current_user
    @personal_detail = PersonalDetail.new
  end


  def create
    @user = current_user
    @personal_detail = @user.build_personal_detail(detail_params)
    @personal_detail.date = Date.today
    if @personal_detail.save
      if @user.schedule.workout_windows.blank?
        flash[:notice] = "Now we want to collect some information about your schedule!"
        redirect_to new_user_schedule_path
      else
        flash[:notice] = "Thanks for checking in! We'll track your progress"
        redirect_to user_dashboard_path
      end
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
    @personal_detail.date = Date.today
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
    params.require(:personal_detail).permit(:gender, :weight, :bicep, :shoulders, :chest, :neck, :waist, :hips, :thigh, :resting_heart_rate, :calf, :submit, :date)
  end
end
