class InitialTestController < ApplicationController
  include Wicked::Wizard

  steps :basic_bodyweight, :one_mile, :gym_maxes

  def show
    @user = current_user
    @initial_test = InitialTest.new
    case steps
      when :basic_bodyweight
        #TODO inital test logic here
        @user = current_user

      when :one_mile
        #TODO just going for a little run
        @initial_test = InitialTest.find(params[:initial_test])
      when :advanced_test
        #TODO harder tests
    end
    render_wizard
  end


  def update

  end
end
