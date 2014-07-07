class RegistrationsController < Devise::RegistrationsController


  protected

  def after_sign_up_path_for(resource)
    '/users/about_yourself'
  end
end