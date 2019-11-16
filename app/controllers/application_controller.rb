class ApplicationController < ActionController::Base
  if Rails.env.development?
    require 'http_logger'
  end
end
