require 'test_helper'

class TimecardsControllerTest < ActionController::TestCase
  setup do
    @timecard = timecards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timecards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timecard" do
    assert_difference('Timecard.count') do
      post :create, timecard: { doubletime: @timecard.doubletime, employee: @timecard.employee, end: @timecard.end, holiday: @timecard.holiday, other: @timecard.other, overtime: @timecard.overtime, personal: @timecard.personal, regular: @timecard.regular, sick: @timecard.sick, start: @timecard.start, user_id: @timecard.user_id, vacation: @timecard.vacation }
    end

    assert_redirected_to timecard_path(assigns(:timecard))
  end

  test "should show timecard" do
    get :show, id: @timecard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timecard
    assert_response :success
  end

  test "should update timecard" do
    patch :update, id: @timecard, timecard: { doubletime: @timecard.doubletime, employee: @timecard.employee, end: @timecard.end, holiday: @timecard.holiday, other: @timecard.other, overtime: @timecard.overtime, personal: @timecard.personal, regular: @timecard.regular, sick: @timecard.sick, start: @timecard.start, user_id: @timecard.user_id, vacation: @timecard.vacation }
    assert_redirected_to timecard_path(assigns(:timecard))
  end

  test "should destroy timecard" do
    assert_difference('Timecard.count', -1) do
      delete :destroy, id: @timecard
    end

    assert_redirected_to timecards_path
  end
end
