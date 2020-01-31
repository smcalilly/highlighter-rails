class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def install
  end

  def welcome
  end

  protected
  def after_sign_up_path_for(resource)
    '/users/welcome'
  end
end  