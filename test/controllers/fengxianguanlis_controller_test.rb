require 'test_helper'

class FengxianguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fengxianguanli = fengxianguanlis(:one)
  end

  test "should get index" do
    get fengxianguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_fengxianguanli_url
    assert_response :success
  end

  test "should create fengxianguanli" do
    assert_difference('Fengxianguanli.count') do
      post fengxianguanlis_url, params: { fengxianguanli: { fenxiandengji: @fengxianguanli.fenxiandengji, shoujihao: @fengxianguanli.shoujihao, shuoming: @fengxianguanli.shuoming, xingming: @fengxianguanli.xingming } }
    end

    assert_redirected_to fengxianguanli_url(Fengxianguanli.last)
  end

  test "should show fengxianguanli" do
    get fengxianguanli_url(@fengxianguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_fengxianguanli_url(@fengxianguanli)
    assert_response :success
  end

  test "should update fengxianguanli" do
    patch fengxianguanli_url(@fengxianguanli), params: { fengxianguanli: { fenxiandengji: @fengxianguanli.fenxiandengji, shoujihao: @fengxianguanli.shoujihao, shuoming: @fengxianguanli.shuoming, xingming: @fengxianguanli.xingming } }
    assert_redirected_to fengxianguanli_url(@fengxianguanli)
  end

  test "should destroy fengxianguanli" do
    assert_difference('Fengxianguanli.count', -1) do
      delete fengxianguanli_url(@fengxianguanli)
    end

    assert_redirected_to fengxianguanlis_url
  end
end
