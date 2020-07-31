class RegistrationsController < Devise::RegistrationsController
  respond_to :json #don't think this is needed? would assume a user is trying to sign up via extension

  def install
  end

  def welcome
  end

  protected
  def after_sign_up_path_for(resource)
    '/users/welcome'
  end
end  