require 'test_helper'

class PeizhiguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peizhiguanli = peizhiguanlis(:one)
  end

  test "should get index" do
    get peizhiguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_peizhiguanli_url
    assert_response :success
  end

  test "should create peizhiguanli" do
    assert_difference('Peizhiguanli.count') do
      post peizhiguanlis_url, params: { peizhiguanli: { ip: @peizhiguanli.ip, miaoshu: @peizhiguanli.miaoshu, mingzi: @peizhiguanli.mingzi, script: @peizhiguanli.script, ttl: @peizhiguanli.ttl, zhujijilu: @peizhiguanli.zhujijilu } }
    end

    assert_redirected_to peizhiguanli_url(Peizhiguanli.last)
  end

  test "should show peizhiguanli" do
    get peizhiguanli_url(@peizhiguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_peizhiguanli_url(@peizhiguanli)
    assert_response :success
  end

  test "should update peizhiguanli" do
    patch peizhiguanli_url(@peizhiguanli), params: { peizhiguanli: { ip: @peizhiguanli.ip, miaoshu: @peizhiguanli.miaoshu, mingzi: @peizhiguanli.mingzi, script: @peizhiguanli.script, ttl: @peizhiguanli.ttl, zhujijilu: @peizhiguanli.zhujijilu } }
    assert_redirected_to peizhiguanli_url(@peizhiguanli)
  end

  test "should destroy peizhiguanli" do
    assert_difference('Peizhiguanli.count', -1) do
      delete peizhiguanli_url(@peizhiguanli)
    end

    assert_redirected_to peizhiguanlis_url
  end
end
