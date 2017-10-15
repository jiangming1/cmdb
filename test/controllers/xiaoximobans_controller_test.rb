require 'test_helper'

class XiaoximobansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xiaoximoban = xiaoximobans(:one)
  end

  test "should get index" do
    get xiaoximobans_url
    assert_response :success
  end

  test "should get new" do
    get new_xiaoximoban_url
    assert_response :success
  end

  test "should create xiaoximoban" do
    assert_difference('Xiaoximoban.count') do
      post xiaoximobans_url, params: { xiaoximoban: { bianma: @xiaoximoban.bianma, biaoti: @xiaoximoban.biaoti, xiaoxineirong: @xiaoximoban.xiaoxineirong } }
    end

    assert_redirected_to xiaoximoban_url(Xiaoximoban.last)
  end

  test "should show xiaoximoban" do
    get xiaoximoban_url(@xiaoximoban)
    assert_response :success
  end

  test "should get edit" do
    get edit_xiaoximoban_url(@xiaoximoban)
    assert_response :success
  end

  test "should update xiaoximoban" do
    patch xiaoximoban_url(@xiaoximoban), params: { xiaoximoban: { bianma: @xiaoximoban.bianma, biaoti: @xiaoximoban.biaoti, xiaoxineirong: @xiaoximoban.xiaoxineirong } }
    assert_redirected_to xiaoximoban_url(@xiaoximoban)
  end

  test "should destroy xiaoximoban" do
    assert_difference('Xiaoximoban.count', -1) do
      delete xiaoximoban_url(@xiaoximoban)
    end

    assert_redirected_to xiaoximobans_url
  end
end
