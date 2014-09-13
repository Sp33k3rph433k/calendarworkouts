class WorkoutsController < ApplicationController


  def new
    @workout = Workout.new
    @exercise = Exercise.new
    @user = current_user
  end

  def create
    @user = current_user
    @workout = @user.workouts.build(detail_params)

    if @workout.save
      flash[:notice] = "Workout created! Now tell us what exercises you did!"
      redirect_to new_workout_exercise_path(@workout)
    else
      flash[:notice] = "Error creating workout"
      redirect_to new_user_workout
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    Workout.find(params[:id]).destroy
    redirect_to user_dashboard_path
  end

  def edit
    @workout = Workout.find(params[:id])

    if @workout.save
      flash[:notice] = "Workout updated!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "Error updating this workout, email support@calendarworkouts.com"
      redirect_to user_dashboard_path
    end
  end

  def show
    @workout = Workout.find(params[:id])

  end

  def index
    @user = current_user
    @workouts = @user.workouts #TODO: Turn this shiz into JSON for the calendar!
    @json = []

    @workouts.each do |w|
      r = {}
      r[:title] = w.name
      r[:start] = w.created_at
      @json << r
    end
  end


#   vents: [
#       {
#           title  : 'event1',
#       start  : '2010-01-01'
#   },
#       {
#           title  : 'event2',
#       start  : '2010-01-05',
# end    : '2010-01-07'
# },
#     {
#         title  : 'event3',
#     start  : '2010-01-09T12:30:00',
#     allDay : false // will make the time show
#         }
#     ]

  private

  def detail_params
    params.require(:workout).permit(:name, :date)
  end
end
