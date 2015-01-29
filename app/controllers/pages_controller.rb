class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :get_user
  layout :layout_for_page

  private

  def layout_for_page
   'application'
  end

  def get_user
    @user = current_user
  end
end