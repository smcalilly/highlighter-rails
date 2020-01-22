require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @source = sources(:one)
    @unauthorized_source = sources(:two)
  end

  def login_user
    get '/users/sign_in'
    sign_in users(:obama)
    post user_session_url
    @unauthorized_highlight
  end
end
