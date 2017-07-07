require 'test_helper'

class DnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dn = dns(:one)
  end

  test "should get index" do
    get dns_url
    assert_response :success
  end

  test "should get new" do
    get new_dn_url
    assert_response :success
  end

  test "should create dn" do
    assert_difference('Dn.count') do
      post dns_url, params: { dn: { ip: @dn.ip, miaoshu: @dn.miaoshu, mingzi: @dn.mingzi, ttl: @dn.ttl, zhujijilu: @dn.zhujijilu } }
    end

    assert_redirected_to dn_url(Dn.last)
  end

  test "should show dn" do
    get dn_url(@dn)
    assert_response :success
  end

  test "should get edit" do
    get edit_dn_url(@dn)
    assert_response :success
  end

  test "should update dn" do
    patch dn_url(@dn), params: { dn: { ip: @dn.ip, miaoshu: @dn.miaoshu, mingzi: @dn.mingzi, ttl: @dn.ttl, zhujijilu: @dn.zhujijilu } }
    assert_redirected_to dn_url(@dn)
  end

  test "should destroy dn" do
    assert_difference('Dn.count', -1) do
      delete dn_url(@dn)
    end

    assert_redirected_to dns_url
  end
end
