require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @source = sources(:one)
    @unauthorized_source = sources(:two)
  end

  def login_user_via_extension
    # log in with json post and return jwt
  end

  test "should test chrome client" do
    #test login
    #test jwt
    #test source creation

    
    #save source
  end

  def login_user_via_ui
    get '/users/sign_in'
    sign_in users(:obama)
    post user_session_url
  end

  test "should not get index" do
    # as the public
    get sources_url
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not get anything from another user
    login_user_via_ui
    get sources_url(@unauthorized_source)
    assert_redirected_to sources_url
  end

  test 'should get index' do
    # as the public
    login_user_via_ui
    get sources_url
    assert_response :success
  end

  test "should not get new" do
    # as the public
    get new_source_url
    assert_redirected_to '/users/sign_in'
  end

  test "should get new" do
    login_user_via_ui
    get new_source_url
    assert_response :success
  end

  test "should not create source" do
    # as the public
    assert_difference('Source.count', 0) do
      post sources_url, params: { source: { location: @source.location, title: @source.title } }
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should create source" do
    login_user_via_ui
    assert_difference('Source.count', 0) do
      post sources_url, params: { source: { location: @source.location, title: @source.title } }
    end
    assert_response :redirect
  end

  test "should not show source" do
    # as the public
    get source_url(@source)
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not show anything from another account
    login_user_via_ui
    get source_url(@unauthorized_source)
    assert_response :redirect
  end

  test "should show source" do
    login_user_via_ui
    get source_url(@source)
    assert_response :success
  end

  test "should not destroy source" do
    # as the public
    assert_difference('Source.count', 0) do
      delete source_url(@source)
    end
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not delete anything from another account
    login_user_via_ui
    assert_difference('Source.count', 0) do
      delete source_url(@unauthorized_source)
    end
    assert_redirected_to sources_url
  end

  test "should destroy source" do
    # as a user
    login_user_via_ui 
    assert_difference('Source.count', -1) do
      delete source_url(@source)
    end
  end
end
