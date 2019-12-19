require 'test_helper'

class HighlightsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @highlight = highlights(:one)
    @unauthorized_highlight = highlights(:two)
  end

  def login_user
    get '/users/sign_in'
    sign_in users(:obama)
    post user_session_url
    @unauthorized_highlight
  end

  test "should get index" do
    # as the public
    get highlights_url
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user
    get highlights_url
    assert_response :success

    # multi-tenancy: should not get anything from another user
    get highlight_url(@unauthorized_highlight)
    assert_redirected_to highlights_url
  end

  test "should get new" do
    # as the public
    get new_highlight_url
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user
    get new_highlight_url
    assert_response :success
  end

  test "should create highlight" do
    # as the public
    assert_difference('Highlight.count', 0) do
      post highlights_url, params: { highlight: { text: @highlight.text, url: @highlight.url } }
    end
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user
    assert_difference 'Highlight.count', 1 do
      post highlights_url, params: { highlight: { text: @highlight.text, url: @highlight.url } }
    end
    assert_response :redirect
  end

  test "should show highlight" do
    # as the public
    get highlight_url(@highlight)
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user
    get highlight_url(@highlight)
    assert_response :success

    # multi-tenancy: should not show anything from another account
    get highlight_url(@unauthorized_highlight)
    assert_redirected_to highlights_url
  end

  test "should get edit" do
    # as the public
    get edit_highlight_url(@highlight)
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user
    get edit_highlight_url(@highlight)
    assert_response :success

    # multi-tenancy: should not show anything from another account
    get edit_highlight_url(@unauthorized_highlight)
    assert_redirected_to highlights_url
  end

  test "should update highlight" do
    # as the public
    patch highlight_url(@highlight), params: { highlight: { text: @highlight.text, url: @highlight.url } }
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user 
    patch highlight_url(@highlight), params: { highlight: { text: @highlight.text, url: @highlight.url } }
    assert_redirected_to highlight_url

    # multi-tenancy: should not show anything from another account
    patch highlight_url(@unauthorized_highlight), params: { highlight: { text: @highlight.text, url: @highlight.url } }
    assert_redirected_to highlights_url
  end

  test "should destroy highlight" do
    # as the public
    assert_difference('Highlight.count', 0) do
      delete highlight_url(@highlight)
    end
    assert_redirected_to '/users/sign_in'

    # as a user
    login_user 
    assert_difference('Highlight.count', -1) do
      delete highlight_url(@highlight)
    end

    # multi-tenancy: should not delete anything from another account
    assert_difference('Highlight.count', 0) do
      delete highlight_url(@unauthorized_highlight)
    end
    assert_redirected_to highlights_url
  end
end
