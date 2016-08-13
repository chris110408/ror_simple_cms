require 'test_helper'

class PastsControllerTest < ActionController::TestCase
  setup do
    @past = pasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create past" do
    assert_difference('Past.count') do
      post :create, past: {  }
    end

    assert_redirected_to past_path(assigns(:past))
  end

  test "should show past" do
    get :show, id: @past
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @past
    assert_response :success
  end

  test "should update past" do
    patch :update, id: @past, past: {  }
    assert_redirected_to past_path(assigns(:past))
  end

  test "should destroy past" do
    assert_difference('Past.count', -1) do
      delete :destroy, id: @past
    end

    assert_redirected_to pasts_path
  end
end
