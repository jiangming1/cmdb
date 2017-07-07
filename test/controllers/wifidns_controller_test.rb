require 'test_helper'

class WifidnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wifidn = wifidns(:one)
  end

  test "should get index" do
    get wifidns_url
    assert_response :success
  end

  test "should get new" do
    get new_wifidn_url
    assert_response :success
  end

  test "should create wifidn" do
    assert_difference('Wifidn.count') do
      post wifidns_url, params: { wifidn: { miaoshu: @wifidn.miaoshu, name: @wifidn.name, script: @wifidn.script } }
    end

    assert_redirected_to wifidn_url(Wifidn.last)
  end

  test "should show wifidn" do
    get wifidn_url(@wifidn)
    assert_response :success
  end

  test "should get edit" do
    get edit_wifidn_url(@wifidn)
    assert_response :success
  end

  test "should update wifidn" do
    patch wifidn_url(@wifidn), params: { wifidn: { miaoshu: @wifidn.miaoshu, name: @wifidn.name, script: @wifidn.script } }
    assert_redirected_to wifidn_url(@wifidn)
  end

  test "should destroy wifidn" do
    assert_difference('Wifidn.count', -1) do
      delete wifidn_url(@wifidn)
    end

    assert_redirected_to wifidns_url
  end
end
