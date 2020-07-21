class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_request, if: :json_request
  before_action :authenticate_user!, unless: :json_request
  before_action :enable_http_logger

  private
  def json_request
    request.format.json?
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || highlights_path
  end

  def enable_http_logger
    if Rails.env.development?
      require 'http_logger'
    end
  end
end
