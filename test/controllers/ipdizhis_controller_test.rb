require 'test_helper'

class IpdizhisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ipdizhi = ipdizhis(:one)
  end

  test "should get index" do
    get ipdizhis_url
    assert_response :success
  end

  test "should get new" do
    get new_ipdizhi_url
    assert_response :success
  end

  test "should create ipdizhi" do
    assert_difference('Ipdizhi.count') do
      post ipdizhis_url, params: { ipdizhi: { beizhu: @ipdizhi.beizhu, ip: @ipdizhi.ip, quyu: @ipdizhi.quyu, vlan: @ipdizhi.vlan, wangduan: @ipdizhi.wangduan, xitongmingcheng: @ipdizhi.xitongmingcheng, yanma: @ipdizhi.yanma, yingyongduankou: @ipdizhi.yingyongduankou, yuming: @ipdizhi.yuming } }
    end

    assert_redirected_to ipdizhi_url(Ipdizhi.last)
  end

  test "should show ipdizhi" do
    get ipdizhi_url(@ipdizhi)
    assert_response :success
  end

  test "should get edit" do
    get edit_ipdizhi_url(@ipdizhi)
    assert_response :success
  end

  test "should update ipdizhi" do
    patch ipdizhi_url(@ipdizhi), params: { ipdizhi: { beizhu: @ipdizhi.beizhu, ip: @ipdizhi.ip, quyu: @ipdizhi.quyu, vlan: @ipdizhi.vlan, wangduan: @ipdizhi.wangduan, xitongmingcheng: @ipdizhi.xitongmingcheng, yanma: @ipdizhi.yanma, yingyongduankou: @ipdizhi.yingyongduankou, yuming: @ipdizhi.yuming } }
    assert_redirected_to ipdizhi_url(@ipdizhi)
  end

  test "should destroy ipdizhi" do
    assert_difference('Ipdizhi.count', -1) do
      delete ipdizhi_url(@ipdizhi)
    end

    assert_redirected_to ipdizhis_url
  end
end
