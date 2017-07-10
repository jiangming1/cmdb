require 'test_helper'

class ShujufenxisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shujufenxi = shujufenxis(:one)
  end

  test "should get index" do
    get shujufenxis_url
    assert_response :success
  end

  test "should get new" do
    get new_shujufenxi_url
    assert_response :success
  end

  test "should create shujufenxi" do
    assert_difference('Shujufenxi.count') do
      post shujufenxis_url, params: { shujufenxi: { chengxumingcheng: @shujufenxi.chengxumingcheng, wangzhi: @shujufenxi.wangzhi } }
    end

    assert_redirected_to shujufenxi_url(Shujufenxi.last)
  end

  test "should show shujufenxi" do
    get shujufenxi_url(@shujufenxi)
    assert_response :success
  end

  test "should get edit" do
    get edit_shujufenxi_url(@shujufenxi)
    assert_response :success
  end

  test "should update shujufenxi" do
    patch shujufenxi_url(@shujufenxi), params: { shujufenxi: { chengxumingcheng: @shujufenxi.chengxumingcheng, wangzhi: @shujufenxi.wangzhi } }
    assert_redirected_to shujufenxi_url(@shujufenxi)
  end

  test "should destroy shujufenxi" do
    assert_difference('Shujufenxi.count', -1) do
      delete shujufenxi_url(@shujufenxi)
    end

    assert_redirected_to shujufenxis_url
  end
end
