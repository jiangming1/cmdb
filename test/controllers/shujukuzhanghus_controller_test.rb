require 'test_helper'

class ShujukuzhanghusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shujukuzhanghu = shujukuzhanghus(:one)
  end

  test "should get index" do
    get shujukuzhanghus_url
    assert_response :success
  end

  test "should get new" do
    get new_shujukuzhanghu_url
    assert_response :success
  end

  test "should create shujukuzhanghu" do
    assert_difference('Shujukuzhanghu.count') do
      post shujukuzhanghus_url, params: { shujukuzhanghu: { duankou: @shujukuzhanghu.duankou, leixing: @shujukuzhanghu.leixing, shujukumima: @shujukuzhanghu.shujukumima, shujukuzhanghao: @shujukuzhanghu.shujukuzhanghao, shujukuzhanghaobieming: @shujukuzhanghu.shujukuzhanghaobieming, zhixingdexitongzhanghu: @shujukuzhanghu.zhixingdexitongzhanghu } }
    end

    assert_redirected_to shujukuzhanghu_url(Shujukuzhanghu.last)
  end

  test "should show shujukuzhanghu" do
    get shujukuzhanghu_url(@shujukuzhanghu)
    assert_response :success
  end

  test "should get edit" do
    get edit_shujukuzhanghu_url(@shujukuzhanghu)
    assert_response :success
  end

  test "should update shujukuzhanghu" do
    patch shujukuzhanghu_url(@shujukuzhanghu), params: { shujukuzhanghu: { duankou: @shujukuzhanghu.duankou, leixing: @shujukuzhanghu.leixing, shujukumima: @shujukuzhanghu.shujukumima, shujukuzhanghao: @shujukuzhanghu.shujukuzhanghao, shujukuzhanghaobieming: @shujukuzhanghu.shujukuzhanghaobieming, zhixingdexitongzhanghu: @shujukuzhanghu.zhixingdexitongzhanghu } }
    assert_redirected_to shujukuzhanghu_url(@shujukuzhanghu)
  end

  test "should destroy shujukuzhanghu" do
    assert_difference('Shujukuzhanghu.count', -1) do
      delete shujukuzhanghu_url(@shujukuzhanghu)
    end

    assert_redirected_to shujukuzhanghus_url
  end
end
