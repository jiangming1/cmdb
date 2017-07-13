require 'test_helper'

class ShujukusqlguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shujukusqlguanli = shujukusqlguanlis(:one)
  end

  test "should get index" do
    get shujukusqlguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_shujukusqlguanli_url
    assert_response :success
  end

  test "should create shujukusqlguanli" do
    assert_difference('Shujukusqlguanli.count') do
      post shujukusqlguanlis_url, params: { shujukusqlguanli: { jiaobenmingcheng: @shujukusqlguanli.jiaobenmingcheng, jiaobenneirong: @shujukusqlguanli.jiaobenneirong } }
    end

    assert_redirected_to shujukusqlguanli_url(Shujukusqlguanli.last)
  end

  test "should show shujukusqlguanli" do
    get shujukusqlguanli_url(@shujukusqlguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_shujukusqlguanli_url(@shujukusqlguanli)
    assert_response :success
  end

  test "should update shujukusqlguanli" do
    patch shujukusqlguanli_url(@shujukusqlguanli), params: { shujukusqlguanli: { jiaobenmingcheng: @shujukusqlguanli.jiaobenmingcheng, jiaobenneirong: @shujukusqlguanli.jiaobenneirong } }
    assert_redirected_to shujukusqlguanli_url(@shujukusqlguanli)
  end

  test "should destroy shujukusqlguanli" do
    assert_difference('Shujukusqlguanli.count', -1) do
      delete shujukusqlguanli_url(@shujukusqlguanli)
    end

    assert_redirected_to shujukusqlguanlis_url
  end
end
