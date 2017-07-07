require 'test_helper'

class SslzhengshusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sslzhengshu = sslzhengshus(:one)
  end

  test "should get index" do
    get sslzhengshus_url
    assert_response :success
  end

  test "should get new" do
    get new_sslzhengshu_url
    assert_response :success
  end

  test "should create sslzhengshu" do
    assert_difference('Sslzhengshu.count') do
      post sslzhengshus_url, params: { sslzhengshu: { guoqiriqi: @sslzhengshu.guoqiriqi, miaoshu: @sslzhengshu.miaoshu, name: @sslzhengshu.name, script: @sslzhengshu.script } }
    end

    assert_redirected_to sslzhengshu_url(Sslzhengshu.last)
  end

  test "should show sslzhengshu" do
    get sslzhengshu_url(@sslzhengshu)
    assert_response :success
  end

  test "should get edit" do
    get edit_sslzhengshu_url(@sslzhengshu)
    assert_response :success
  end

  test "should update sslzhengshu" do
    patch sslzhengshu_url(@sslzhengshu), params: { sslzhengshu: { guoqiriqi: @sslzhengshu.guoqiriqi, miaoshu: @sslzhengshu.miaoshu, name: @sslzhengshu.name, script: @sslzhengshu.script } }
    assert_redirected_to sslzhengshu_url(@sslzhengshu)
  end

  test "should destroy sslzhengshu" do
    assert_difference('Sslzhengshu.count', -1) do
      delete sslzhengshu_url(@sslzhengshu)
    end

    assert_redirected_to sslzhengshus_url
  end
end
