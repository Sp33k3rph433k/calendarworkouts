class InjuriesController < ApplicationController

  def new
    @user = current_user
    @injury = Injury.new
    @injury.body_parts.build
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @injury = @user.injuries.build
    if @injury.save
      body_part_attributes = params[:injury][:body_parts_attributes].first
      body_part_attributes.last["part_name"].each do |f|
        @injury.body_parts.create(part_name: f) unless f.blank?
      end

      redirect_to new_user_personal_detail_path(@user)
      flash[:notice] = "Thanks! We'll make sure to give you workouts based on what you're able to do!"
    else
      redirect_to :back
      flash[:notice] = "There was an error in the injuries_controller#create!"
    end
  end

  def injury_params
    params.require(:injury).permit(:user_id, :injury_ids => [], :body_parts_attributes => [])
  end
end
