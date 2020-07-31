class ApplicationController < ActionController::Base
  include Pundit

  # turn off CSRF and let the api controllers handle authentication
  protect_from_forgery unless: :json_request
  before_action :authenticate_user!, unless: :json_request

  private
  def json_request
    request.format.json?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || home_path
  end

  def enable_http_logger
    if Rails.env.development?
      require 'http_logger'
    end
  end
end