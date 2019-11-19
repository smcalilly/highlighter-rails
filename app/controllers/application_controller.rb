class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_request, if: :json_request
  before_action :authenticate_user!, unless: :json_request
  
  
  #attr_reader :current_user

  private
  def json_request
    request.format.json?
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    puts @current_user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
