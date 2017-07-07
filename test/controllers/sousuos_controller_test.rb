require 'test_helper'

class SousuosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sousuo = sousuos(:one)
  end

  test "should get index" do
    get sousuos_url
    assert_response :success
  end

  test "should get new" do
    get new_sousuo_url
    assert_response :success
  end

  test "should create sousuo" do
    assert_difference('Sousuo.count') do
      post sousuos_url, params: { sousuo: { appname: @sousuo.appname, gongsi: @sousuo.gongsi, leixing: @sousuo.leixing, qushi: @sousuo.qushi, type: @sousuo.type } }
    end

    assert_redirected_to sousuo_url(Sousuo.last)
  end

  test "should show sousuo" do
    get sousuo_url(@sousuo)
    assert_response :success
  end

  test "should get edit" do
    get edit_sousuo_url(@sousuo)
    assert_response :success
  end

  test "should update sousuo" do
    patch sousuo_url(@sousuo), params: { sousuo: { appname: @sousuo.appname, gongsi: @sousuo.gongsi, leixing: @sousuo.leixing, qushi: @sousuo.qushi, type: @sousuo.type } }
    assert_redirected_to sousuo_url(@sousuo)
  end

  test "should destroy sousuo" do
    assert_difference('Sousuo.count', -1) do
      delete sousuo_url(@sousuo)
    end

    assert_redirected_to sousuos_url
  end
end
