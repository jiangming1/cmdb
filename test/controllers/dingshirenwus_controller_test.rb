require 'test_helper'

class DingshirenwusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dingshirenwu = dingshirenwus(:one)
  end

  test "should get index" do
    get dingshirenwus_url
    assert_response :success
  end

  test "should get new" do
    get new_dingshirenwu_url
    assert_response :success
  end

  test "should create dingshirenwu" do
    assert_difference('Dingshirenwu.count') do
      post dingshirenwus_url, params: { dingshirenwu: { dingshiguize: @dingshirenwu.dingshiguize, dingshirenwu: @dingshirenwu.dingshirenwu, zuoyemingchen: @dingshirenwu.zuoyemingchen } }
    end

    assert_redirected_to dingshirenwu_url(Dingshirenwu.last)
  end

  test "should show dingshirenwu" do
    get dingshirenwu_url(@dingshirenwu)
    assert_response :success
  end

  test "should get edit" do
    get edit_dingshirenwu_url(@dingshirenwu)
    assert_response :success
  end

  test "should update dingshirenwu" do
    patch dingshirenwu_url(@dingshirenwu), params: { dingshirenwu: { dingshiguize: @dingshirenwu.dingshiguize, dingshirenwu: @dingshirenwu.dingshirenwu, zuoyemingchen: @dingshirenwu.zuoyemingchen } }
    assert_redirected_to dingshirenwu_url(@dingshirenwu)
  end

  test "should destroy dingshirenwu" do
    assert_difference('Dingshirenwu.count', -1) do
      delete dingshirenwu_url(@dingshirenwu)
    end

    assert_redirected_to dingshirenwus_url
  end
end
