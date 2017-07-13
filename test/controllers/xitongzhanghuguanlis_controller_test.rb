require 'test_helper'

class XitongzhanghuguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xitongzhanghuguanli = xitongzhanghuguanlis(:one)
  end

  test "should get index" do
    get xitongzhanghuguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_xitongzhanghuguanli_url
    assert_response :success
  end

  test "should create xitongzhanghuguanli" do
    assert_difference('Xitongzhanghuguanli.count') do
      post xitongzhanghuguanlis_url, params: { xitongzhanghuguanli: { xitongmima: @xitongzhanghuguanli.xitongmima, xitongzhanghao: @xitongzhanghuguanli.xitongzhanghao } }
    end

    assert_redirected_to xitongzhanghuguanli_url(Xitongzhanghuguanli.last)
  end

  test "should show xitongzhanghuguanli" do
    get xitongzhanghuguanli_url(@xitongzhanghuguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_xitongzhanghuguanli_url(@xitongzhanghuguanli)
    assert_response :success
  end

  test "should update xitongzhanghuguanli" do
    patch xitongzhanghuguanli_url(@xitongzhanghuguanli), params: { xitongzhanghuguanli: { xitongmima: @xitongzhanghuguanli.xitongmima, xitongzhanghao: @xitongzhanghuguanli.xitongzhanghao } }
    assert_redirected_to xitongzhanghuguanli_url(@xitongzhanghuguanli)
  end

  test "should destroy xitongzhanghuguanli" do
    assert_difference('Xitongzhanghuguanli.count', -1) do
      delete xitongzhanghuguanli_url(@xitongzhanghuguanli)
    end

    assert_redirected_to xitongzhanghuguanlis_url
  end
end
