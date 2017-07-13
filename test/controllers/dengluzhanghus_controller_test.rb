require 'test_helper'

class DengluzhanghusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dengluzhanghu = dengluzhanghus(:one)
  end

  test "should get index" do
    get dengluzhanghus_url
    assert_response :success
  end

  test "should get new" do
    get new_dengluzhanghu_url
    assert_response :success
  end

  test "should create dengluzhanghu" do
    assert_difference('Dengluzhanghu.count') do
      post dengluzhanghus_url, params: { dengluzhanghu: { zhanghaomima: @dengluzhanghu.zhanghaomima, zhanghaomingcheng: @dengluzhanghu.zhanghaomingcheng } }
    end

    assert_redirected_to dengluzhanghu_url(Dengluzhanghu.last)
  end

  test "should show dengluzhanghu" do
    get dengluzhanghu_url(@dengluzhanghu)
    assert_response :success
  end

  test "should get edit" do
    get edit_dengluzhanghu_url(@dengluzhanghu)
    assert_response :success
  end

  test "should update dengluzhanghu" do
    patch dengluzhanghu_url(@dengluzhanghu), params: { dengluzhanghu: { zhanghaomima: @dengluzhanghu.zhanghaomima, zhanghaomingcheng: @dengluzhanghu.zhanghaomingcheng } }
    assert_redirected_to dengluzhanghu_url(@dengluzhanghu)
  end

  test "should destroy dengluzhanghu" do
    assert_difference('Dengluzhanghu.count', -1) do
      delete dengluzhanghu_url(@dengluzhanghu)
    end

    assert_redirected_to dengluzhanghus_url
  end
end
