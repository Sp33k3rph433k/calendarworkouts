class RegistrationsController < Devise::RegistrationsController


  protected

  def after_sign_up_path_for(resource)
    page_path('ready')
  end
end