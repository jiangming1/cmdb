require 'test_helper'

class ShujukujiaobensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shujukujiaoben = shujukujiaobens(:one)
  end

  test "should get index" do
    get shujukujiaobens_url
    assert_response :success
  end

  test "should get new" do
    get new_shujukujiaoben_url
    assert_response :success
  end

  test "should create shujukujiaoben" do
    assert_difference('Shujukujiaoben.count') do
      post shujukujiaobens_url, params: { shujukujiaoben: { buzhoumingcheng: @shujukujiaoben.buzhoumingcheng, caoshishijian: @shujukujiaoben.caoshishijian, jiaobenlaiyuan: @shujukujiaoben.jiaobenlaiyuan, jiaobenmingcheng: @shujukujiaoben.jiaobenmingcheng, jiaobenneirong: @shujukujiaoben.jiaobenneirong, mubiaojiqi: @shujukujiaoben.mubiaojiqi, shujuquzhanghao: @shujukujiaoben.shujuquzhanghao } }
    end

    assert_redirected_to shujukujiaoben_url(Shujukujiaoben.last)
  end

  test "should show shujukujiaoben" do
    get shujukujiaoben_url(@shujukujiaoben)
    assert_response :success
  end

  test "should get edit" do
    get edit_shujukujiaoben_url(@shujukujiaoben)
    assert_response :success
  end

  test "should update shujukujiaoben" do
    patch shujukujiaoben_url(@shujukujiaoben), params: { shujukujiaoben: { buzhoumingcheng: @shujukujiaoben.buzhoumingcheng, caoshishijian: @shujukujiaoben.caoshishijian, jiaobenlaiyuan: @shujukujiaoben.jiaobenlaiyuan, jiaobenmingcheng: @shujukujiaoben.jiaobenmingcheng, jiaobenneirong: @shujukujiaoben.jiaobenneirong, mubiaojiqi: @shujukujiaoben.mubiaojiqi, shujuquzhanghao: @shujukujiaoben.shujuquzhanghao } }
    assert_redirected_to shujukujiaoben_url(@shujukujiaoben)
  end

  test "should destroy shujukujiaoben" do
    assert_difference('Shujukujiaoben.count', -1) do
      delete shujukujiaoben_url(@shujukujiaoben)
    end

    assert_redirected_to shujukujiaobens_url
  end
end
