require 'test_helper'

class UmengsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @umeng = umengs(:one)
  end

  test "should get index" do
    get umengs_url
    assert_response :success
  end

  test "should get new" do
    get new_umeng_url
    assert_response :success
  end

  test "should create umeng" do
    assert_difference('Umeng.count') do
      post umengs_url, params: { umeng: { huoyueyonghu: @umeng.huoyueyonghu, jinrixinzeng: @umeng.jinrixinzeng, yingyongming: @umeng.yingyongming, zuorileiji: @umeng.zuorileiji, zuoriqidongcishu: @umeng.zuoriqidongcishu } }
    end

    assert_redirected_to umeng_url(Umeng.last)
  end

  test "should show umeng" do
    get umeng_url(@umeng)
    assert_response :success
  end

  test "should get edit" do
    get edit_umeng_url(@umeng)
    assert_response :success
  end

  test "should update umeng" do
    patch umeng_url(@umeng), params: { umeng: { huoyueyonghu: @umeng.huoyueyonghu, jinrixinzeng: @umeng.jinrixinzeng, yingyongming: @umeng.yingyongming, zuorileiji: @umeng.zuorileiji, zuoriqidongcishu: @umeng.zuoriqidongcishu } }
    assert_redirected_to umeng_url(@umeng)
  end

  test "should destroy umeng" do
    assert_difference('Umeng.count', -1) do
      delete umeng_url(@umeng)
    end

    assert_redirected_to umengs_url
  end
end
