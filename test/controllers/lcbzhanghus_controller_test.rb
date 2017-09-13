require 'test_helper'

class LcbzhanghusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lcbzhanghu = lcbzhanghus(:one)
  end

  test "should get index" do
    get lcbzhanghus_url
    assert_response :success
  end

  test "should get new" do
    get new_lcbzhanghu_url
    assert_response :success
  end

  test "should create lcbzhanghu" do
    assert_difference('Lcbzhanghu.count') do
      post lcbzhanghus_url, params: { lcbzhanghu: { denglumima: @lcbzhanghu.denglumima, dengluxingming: @lcbzhanghu.dengluxingming, shouji: @lcbzhanghu.shouji, xingming: @lcbzhanghu.xingming, yaoqingma: @lcbzhanghu.yaoqingma, yaoqingren: @lcbzhanghu.yaoqingren, zhifumima: @lcbzhanghu.zhifumima, zhuangtai: @lcbzhanghu.zhuangtai } }
    end

    assert_redirected_to lcbzhanghu_url(Lcbzhanghu.last)
  end

  test "should show lcbzhanghu" do
    get lcbzhanghu_url(@lcbzhanghu)
    assert_response :success
  end

  test "should get edit" do
    get edit_lcbzhanghu_url(@lcbzhanghu)
    assert_response :success
  end

  test "should update lcbzhanghu" do
    patch lcbzhanghu_url(@lcbzhanghu), params: { lcbzhanghu: { denglumima: @lcbzhanghu.denglumima, dengluxingming: @lcbzhanghu.dengluxingming, shouji: @lcbzhanghu.shouji, xingming: @lcbzhanghu.xingming, yaoqingma: @lcbzhanghu.yaoqingma, yaoqingren: @lcbzhanghu.yaoqingren, zhifumima: @lcbzhanghu.zhifumima, zhuangtai: @lcbzhanghu.zhuangtai } }
    assert_redirected_to lcbzhanghu_url(@lcbzhanghu)
  end

  test "should destroy lcbzhanghu" do
    assert_difference('Lcbzhanghu.count', -1) do
      delete lcbzhanghu_url(@lcbzhanghu)
    end

    assert_redirected_to lcbzhanghus_url
  end
end
