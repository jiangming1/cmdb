require 'test_helper'

class LvmaotongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lvmaotong = lvmaotongs(:one)
  end

  test "should get index" do
    get lvmaotongs_url
    assert_response :success
  end

  test "should get new" do
    get new_lvmaotong_url
    assert_response :success
  end

  test "should create lvmaotong" do
    assert_difference('Lvmaotong.count') do
      post lvmaotongs_url, params: { lvmaotong: { dianhua: @lvmaotong.dianhua, xingming: @lvmaotong.xingming } }
    end

    assert_redirected_to lvmaotong_url(Lvmaotong.last)
  end

  test "should show lvmaotong" do
    get lvmaotong_url(@lvmaotong)
    assert_response :success
  end

  test "should get edit" do
    get edit_lvmaotong_url(@lvmaotong)
    assert_response :success
  end

  test "should update lvmaotong" do
    patch lvmaotong_url(@lvmaotong), params: { lvmaotong: { dianhua: @lvmaotong.dianhua, xingming: @lvmaotong.xingming } }
    assert_redirected_to lvmaotong_url(@lvmaotong)
  end

  test "should destroy lvmaotong" do
    assert_difference('Lvmaotong.count', -1) do
      delete lvmaotong_url(@lvmaotong)
    end

    assert_redirected_to lvmaotongs_url
  end
end
