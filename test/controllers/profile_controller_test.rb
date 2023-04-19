require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users = users(:one)
  end

  test "should retrive the user's bedtime logs" do
    get '/profile/bedtime_logs', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 200
  end

  test "should respond with status 401 if unauthorized access to the `/profile/bedtime_logs` endpoint" do
    get '/profile/bedtime_logs', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end

  test "should retrieve all the followed users of a user" do
    get '/profile/following', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 200
  end

  test "should respond with status 401 if unauthorized access to the `/profile/following` endpoint" do
    get '/profile/following', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end
end
