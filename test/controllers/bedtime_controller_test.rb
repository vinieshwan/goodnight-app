require "test_helper"

class BedtimeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users = users(:one)
  end

  test "should log a user sleep time" do
    post '/bedtime/in', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 201
  end

  test "should respond with status 401 if unauthorized access to the `/bedtime/in` endpoint" do
    post '/bedtime/in', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end

  test "should log a user wakeup time" do
    post '/bedtime/out', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 200
  end

  test "should respond with status 400 if you the last clock in has already clocked out" do
    post '/bedtime/out', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 
    post '/bedtime/out', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@users.api_key, '')} 

    assert_equal status, 400
  end

  test "should respond with status 401 if unauthorized access to the `/bedtime/out` endpoint" do
    post '/bedtime/out', headers: {Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('sample', '')} 

    assert_equal status, 401
  end
end
