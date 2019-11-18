class ApplicationController < ActionController::Base
  require 'http_logger'
  before_action :authenticate_user!
end
