require 'test_helper'

class QuanxianguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quanxianguanli = quanxianguanlis(:one)
  end

  test "should get index" do
    get quanxianguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_quanxianguanli_url
    assert_response :success
  end

  test "should create quanxianguanli" do
    assert_difference('Quanxianguanli.count') do
      post quanxianguanlis_url, params: { quanxianguanli: { dizhi: @quanxianguanli.dizhi, qiyong: @quanxianguanli.qiyong, quanxianmingcheng: @quanxianguanli.quanxianmingcheng, suoshucaidan: @quanxianguanli.suoshucaidan } }
    end

    assert_redirected_to quanxianguanli_url(Quanxianguanli.last)
  end

  test "should show quanxianguanli" do
    get quanxianguanli_url(@quanxianguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_quanxianguanli_url(@quanxianguanli)
    assert_response :success
  end

  test "should update quanxianguanli" do
    patch quanxianguanli_url(@quanxianguanli), params: { quanxianguanli: { dizhi: @quanxianguanli.dizhi, qiyong: @quanxianguanli.qiyong, quanxianmingcheng: @quanxianguanli.quanxianmingcheng, suoshucaidan: @quanxianguanli.suoshucaidan } }
    assert_redirected_to quanxianguanli_url(@quanxianguanli)
  end

  test "should destroy quanxianguanli" do
    assert_difference('Quanxianguanli.count', -1) do
      delete quanxianguanli_url(@quanxianguanli)
    end

    assert_redirected_to quanxianguanlis_url
  end
end
