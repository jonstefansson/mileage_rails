require 'test_helper'

class FillupsControllerTest < ActionController::TestCase
  setup do
    @fillup = fillups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fillups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fillup" do
    assert_difference('Fillup.count') do
      post :create, fillup: { fill_date: @fillup.fill_date, gallons: @fillup.gallons, odometer: @fillup.odometer }
    end

    assert_redirected_to fillup_path(assigns(:fillup))
  end

  test "should show fillup" do
    get :show, id: @fillup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fillup
    assert_response :success
  end

  test "should update fillup" do
    patch :update, id: @fillup, fillup: { fill_date: @fillup.fill_date, gallons: @fillup.gallons, odometer: @fillup.odometer }
    assert_redirected_to fillup_path(assigns(:fillup))
  end

  test "should destroy fillup" do
    assert_difference('Fillup.count', -1) do
      delete :destroy, id: @fillup
    end

    assert_redirected_to fillups_path
  end
end
