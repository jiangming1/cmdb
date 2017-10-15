require 'test_helper'

class GuanliyuansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guanliyuan = guanliyuans(:one)
  end

  test "should get index" do
    get guanliyuans_url
    assert_response :success
  end

  test "should get new" do
    get new_guanliyuan_url
    assert_response :success
  end

  test "should create guanliyuan" do
    assert_difference('Guanliyuan.count') do
      post guanliyuans_url, params: { guanliyuan: { chuangjianshijian: @guanliyuan.chuangjianshijian, dengji: @guanliyuan.dengji, qiyong: @guanliyuan.qiyong, shouji: @guanliyuan.shouji, suoshujiaose: @guanliyuan.suoshujiaose, suoshujigou: @guanliyuan.suoshujigou, xingbie: @guanliyuan.xingbie, xingming: @guanliyuan.xingming, zhanghao: @guanliyuan.zhanghao } }
    end

    assert_redirected_to guanliyuan_url(Guanliyuan.last)
  end

  test "should show guanliyuan" do
    get guanliyuan_url(@guanliyuan)
    assert_response :success
  end

  test "should get edit" do
    get edit_guanliyuan_url(@guanliyuan)
    assert_response :success
  end

  test "should update guanliyuan" do
    patch guanliyuan_url(@guanliyuan), params: { guanliyuan: { chuangjianshijian: @guanliyuan.chuangjianshijian, dengji: @guanliyuan.dengji, qiyong: @guanliyuan.qiyong, shouji: @guanliyuan.shouji, suoshujiaose: @guanliyuan.suoshujiaose, suoshujigou: @guanliyuan.suoshujigou, xingbie: @guanliyuan.xingbie, xingming: @guanliyuan.xingming, zhanghao: @guanliyuan.zhanghao } }
    assert_redirected_to guanliyuan_url(@guanliyuan)
  end

  test "should destroy guanliyuan" do
    assert_difference('Guanliyuan.count', -1) do
      delete guanliyuan_url(@guanliyuan)
    end

    assert_redirected_to guanliyuans_url
  end
end
