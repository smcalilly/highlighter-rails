class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :enable_http_logger

  private
  def enable_http_logger
    if Rails.env.development?
      require 'http_logger'
    end
  end
end
