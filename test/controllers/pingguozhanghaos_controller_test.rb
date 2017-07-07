require 'test_helper'

class PingguozhanghaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pingguozhanghao = pingguozhanghaos(:one)
  end

  test "should get index" do
    get pingguozhanghaos_url
    assert_response :success
  end

  test "should get new" do
    get new_pingguozhanghao_url
    assert_response :success
  end

  test "should create pingguozhanghao" do
    assert_difference('Pingguozhanghao.count') do
      post pingguozhanghaos_url, params: { pingguozhanghao: { beizhu: @pingguozhanghao.beizhu, zhanghao: @pingguozhanghao.zhanghao, zhanghaomima: @pingguozhanghao.zhanghaomima, zhuangtai: @pingguozhanghao.zhuangtai } }
    end

    assert_redirected_to pingguozhanghao_url(Pingguozhanghao.last)
  end

  test "should show pingguozhanghao" do
    get pingguozhanghao_url(@pingguozhanghao)
    assert_response :success
  end

  test "should get edit" do
    get edit_pingguozhanghao_url(@pingguozhanghao)
    assert_response :success
  end

  test "should update pingguozhanghao" do
    patch pingguozhanghao_url(@pingguozhanghao), params: { pingguozhanghao: { beizhu: @pingguozhanghao.beizhu, zhanghao: @pingguozhanghao.zhanghao, zhanghaomima: @pingguozhanghao.zhanghaomima, zhuangtai: @pingguozhanghao.zhuangtai } }
    assert_redirected_to pingguozhanghao_url(@pingguozhanghao)
  end

  test "should destroy pingguozhanghao" do
    assert_difference('Pingguozhanghao.count', -1) do
      delete pingguozhanghao_url(@pingguozhanghao)
    end

    assert_redirected_to pingguozhanghaos_url
  end
end
