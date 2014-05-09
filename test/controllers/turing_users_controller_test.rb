require 'test_helper'

class TuringUsersControllerTest < ActionController::TestCase
  setup do
    @turing_user = turing_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turing_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turing_user" do
    assert_difference('TuringUser.count') do
      post :create, turing_user: { FirstName: @turing_user.FirstName, LastName: @turing_user.LastName, identifier: @turing_user.identifier, password: @turing_user.password }
    end

    assert_redirected_to turing_user_path(assigns(:turing_user))
  end

  test "should show turing_user" do
    get :show, id: @turing_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turing_user
    assert_response :success
  end

  test "should update turing_user" do
    patch :update, id: @turing_user, turing_user: { FirstName: @turing_user.FirstName, LastName: @turing_user.LastName, identifier: @turing_user.identifier, password: @turing_user.password }
    assert_redirected_to turing_user_path(assigns(:turing_user))
  end

  test "should destroy turing_user" do
    assert_difference('TuringUser.count', -1) do
      delete :destroy, id: @turing_user
    end

    assert_redirected_to turing_users_path
  end
end
