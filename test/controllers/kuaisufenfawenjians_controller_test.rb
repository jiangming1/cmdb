require 'test_helper'

class KuaisufenfawenjiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kuaisufenfawenjian = kuaisufenfawenjians(:one)
  end

  test "should get index" do
    get kuaisufenfawenjians_url
    assert_response :success
  end

  test "should get new" do
    get new_kuaisufenfawenjian_url
    assert_response :success
  end

  test "should create kuaisufenfawenjian" do
    assert_difference('Kuaisufenfawenjian.count') do
      post kuaisufenfawenjians_url, params: { kuaisufenfawenjian: { mubiaojiqi: @kuaisufenfawenjian.mubiaojiqi, mubiaowenjian: @kuaisufenfawenjian.mubiaowenjian, yuanwenjian: @kuaisufenfawenjian.yuanwenjian, zhixingzhanghu: @kuaisufenfawenjian.zhixingzhanghu, zuoyemingchen: @kuaisufenfawenjian.zuoyemingchen } }
    end

    assert_redirected_to kuaisufenfawenjian_url(Kuaisufenfawenjian.last)
  end

  test "should show kuaisufenfawenjian" do
    get kuaisufenfawenjian_url(@kuaisufenfawenjian)
    assert_response :success
  end

  test "should get edit" do
    get edit_kuaisufenfawenjian_url(@kuaisufenfawenjian)
    assert_response :success
  end

  test "should update kuaisufenfawenjian" do
    patch kuaisufenfawenjian_url(@kuaisufenfawenjian), params: { kuaisufenfawenjian: { mubiaojiqi: @kuaisufenfawenjian.mubiaojiqi, mubiaowenjian: @kuaisufenfawenjian.mubiaowenjian, yuanwenjian: @kuaisufenfawenjian.yuanwenjian, zhixingzhanghu: @kuaisufenfawenjian.zhixingzhanghu, zuoyemingchen: @kuaisufenfawenjian.zuoyemingchen } }
    assert_redirected_to kuaisufenfawenjian_url(@kuaisufenfawenjian)
  end

  test "should destroy kuaisufenfawenjian" do
    assert_difference('Kuaisufenfawenjian.count', -1) do
      delete kuaisufenfawenjian_url(@kuaisufenfawenjian)
    end

    assert_redirected_to kuaisufenfawenjians_url
  end
end
