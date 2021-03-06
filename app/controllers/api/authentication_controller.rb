class Api::AuthenticationController < Api::ApiBaseController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:user][:email], params[:user][:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: 401
    end
  end
end