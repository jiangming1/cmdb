require 'test_helper'

class JiaoseguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jiaoseguanli = jiaoseguanlis(:one)
  end

  test "should get index" do
    get jiaoseguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_jiaoseguanli_url
    assert_response :success
  end

  test "should create jiaoseguanli" do
    assert_difference('Jiaoseguanli.count') do
      post jiaoseguanlis_url, params: { jiaoseguanli: { jiaosedaima: @jiaoseguanli.jiaosedaima, jiaosemingcheng: @jiaoseguanli.jiaosemingcheng, qiyong: @jiaoseguanli.qiyong, suoshuquanxian: @jiaoseguanli.suoshuquanxian } }
    end

    assert_redirected_to jiaoseguanli_url(Jiaoseguanli.last)
  end

  test "should show jiaoseguanli" do
    get jiaoseguanli_url(@jiaoseguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_jiaoseguanli_url(@jiaoseguanli)
    assert_response :success
  end

  test "should update jiaoseguanli" do
    patch jiaoseguanli_url(@jiaoseguanli), params: { jiaoseguanli: { jiaosedaima: @jiaoseguanli.jiaosedaima, jiaosemingcheng: @jiaoseguanli.jiaosemingcheng, qiyong: @jiaoseguanli.qiyong, suoshuquanxian: @jiaoseguanli.suoshuquanxian } }
    assert_redirected_to jiaoseguanli_url(@jiaoseguanli)
  end

  test "should destroy jiaoseguanli" do
    assert_difference('Jiaoseguanli.count', -1) do
      delete jiaoseguanli_url(@jiaoseguanli)
    end

    assert_redirected_to jiaoseguanlis_url
  end
end
