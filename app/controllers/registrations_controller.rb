class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def install
  end
end  