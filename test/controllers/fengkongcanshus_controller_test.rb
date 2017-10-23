require 'test_helper'

class FengkongcanshusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fengkongcanshu = fengkongcanshus(:one)
  end

  test "should get index" do
    get fengkongcanshus_url
    assert_response :success
  end

  test "should get new" do
    get new_fengkongcanshu_url
    assert_response :success
  end

  test "should create fengkongcanshu" do
    assert_difference('Fengkongcanshu.count') do
      post fengkongcanshus_url, params: { fengkongcanshu: { bianma: @fengkongcanshu.bianma, mingcheng: @fengkongcanshu.mingcheng, shuoming: @fengkongcanshu.shuoming, zhi1: @fengkongcanshu.zhi1, zhi2: @fengkongcanshu.zhi2 } }
    end

    assert_redirected_to fengkongcanshu_url(Fengkongcanshu.last)
  end

  test "should show fengkongcanshu" do
    get fengkongcanshu_url(@fengkongcanshu)
    assert_response :success
  end

  test "should get edit" do
    get edit_fengkongcanshu_url(@fengkongcanshu)
    assert_response :success
  end

  test "should update fengkongcanshu" do
    patch fengkongcanshu_url(@fengkongcanshu), params: { fengkongcanshu: { bianma: @fengkongcanshu.bianma, mingcheng: @fengkongcanshu.mingcheng, shuoming: @fengkongcanshu.shuoming, zhi1: @fengkongcanshu.zhi1, zhi2: @fengkongcanshu.zhi2 } }
    assert_redirected_to fengkongcanshu_url(@fengkongcanshu)
  end

  test "should destroy fengkongcanshu" do
    assert_difference('Fengkongcanshu.count', -1) do
      delete fengkongcanshu_url(@fengkongcanshu)
    end

    assert_redirected_to fengkongcanshus_url
  end
end
