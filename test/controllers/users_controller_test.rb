require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users = users(:one)
  end

  test "should retrive the bedtime logs of all followed users for a certain user" do
    get '/users/bedtime_logs', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 200
  end

  test "should respond with status 401 if unauthorized access to the `/users/bedtime_logs` endpoint" do
    get '/users/bedtime_logs', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end

  test "should follow a user" do
    post '/users/2/follow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 204
  end

  test "should respond with status 304 if a user already followed that user" do
    post '/users/2/follow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 
    post '/users/2/follow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 304
  end

  test "should respond with status 404 if provided user id when following is non existent" do
    post '/users/24/follow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 404
  end

  test "should respond with status 401 if unauthorized access to the `/users/:id/follow endpoint" do
    post '/users/1/follow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end

  test "should unfollow a user" do
    post '/users/2/follow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')}
    post '/users/2/unfollow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')}  

    assert_equal status, 204
  end

  test "should respond with status 304 if a user unfollowed a non followed user" do
    post '/users/2/unfollow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 304
  end

  test "should respond with status 404 if provided user id when unfollowing is non existent" do
    post '/users/24/unfollow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 404
  end

  test "should respond with status 401 if unauthorized access to the `/users/:id/unfollow endpoint" do
    post '/users/1/unfollow', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end
end
