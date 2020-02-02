require 'test_helper'
#require 'webmock/minitest'

class HighlightsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @highlight = highlights(:one)
    @unauthorized_highlight = highlights(:two)
  end

  def login_user_via_ui
    get '/users/sign_in'
    sign_in users(:obama)
    post user_session_url
  end

  def login_user_via_extension
    # log in with json post and return jwt
  end

  test "should test chrome client" do
    #test login
    #test jwt
    #test highlight creation

    
    #save highlight
  end

  test "should not get index" do
    # as the public
    get highlights_url
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not get anything from another user
    login_user_via_ui
    get highlight_url(@unauthorized_highlight)
    assert_redirected_to highlights_url
  end

  test "should get index" do
    login_user_via_ui
    get highlights_url
    assert_response :success
  end

  test "should not get new" do
    # as the public
    get new_highlight_url
    assert_redirected_to '/users/sign_in'
  end

  test "should get new" do
    login_user_via_ui
    get new_highlight_url
    assert_response :success
  end

  test "should not create highlight" do
    # as the public
    assert_difference('Highlight.count', 0) do
      post highlights_url, params: { highlight: { text: @highlight.text, url: @highlight.url } }
    end
    assert_redirected_to '/users/sign_in'
  end

  test "should create highlight" do
    login_user_via_ui
    assert_difference [ 'Highlight.count', 'Source.count'], 1 do
      post highlights_url, params: { highlight: { text: @highlight.text, url: @highlight.url } }
    end
    assert_response :redirect
  end

  test "should not show highlight" do
    # as the public
    get highlight_url(@highlight)
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not show anything from another account
    login_user_via_ui
    get highlight_url(@unauthorized_highlight)
    assert_response :redirect
  end

  test "should show highlight" do
    login_user_via_ui
    get highlight_url(@highlight)
    assert_response :success
  end

  test "should not get edit" do
    # as the public
    get edit_highlight_url(@highlight)
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not show anything from another account
    login_user_via_ui
    get edit_highlight_url(@unauthorized_highlight)
    assert_redirected_to highlights_url
  end

  test "should get edit" do
    # as a user
    login_user_via_ui
    get edit_highlight_url(@highlight)
    assert_response :success
  end

  test "should not update highlight" do
    # as the public
    patch highlight_url(@highlight), params: { highlight: { text: @highlight.text, url: @highlight.url } }
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not show anything from another account
    login_user_via_ui
    patch highlight_url(@unauthorized_highlight), params: { highlight: { text: @highlight.text, url: @highlight.url } }
    assert_redirected_to highlights_url
  end

  test "should update highlight" do
    # as a user
    login_user_via_ui 
    patch highlight_url(@highlight), params: { highlight: { text: @highlight.text, url: @highlight.url } }
    assert_response :success
  end

  test "should not destroy highlight" do
    # as the public
    assert_difference('Highlight.count', 0) do
      delete highlight_url(@highlight)
    end
    assert_redirected_to '/users/sign_in'

    # multi-tenancy: should not delete anything from another account
    login_user_via_ui
    assert_difference('Highlight.count', 0) do
      delete highlight_url(@unauthorized_highlight)
    end
    assert_redirected_to highlights_url
  end

  test "should destroy highlight" do
    # as a user
    login_user_via_ui 
    assert_difference('Highlight.count', -1) do
      delete highlight_url(@highlight)
    end
  end
end
