require 'test_helper'

class JichucanshusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jichucanshu = jichucanshus(:one)
  end

  test "should get index" do
    get jichucanshus_url
    assert_response :success
  end

  test "should get new" do
    get new_jichucanshu_url
    assert_response :success
  end

  test "should create jichucanshu" do
    assert_difference('Jichucanshu.count') do
      post jichucanshus_url, params: { jichucanshu: { daimazhi1: @jichucanshu.daimazhi1, daimazhi2: @jichucanshu.daimazhi2, leixingdaima: @jichucanshu.leixingdaima, leixingmingcheng: @jichucanshu.leixingmingcheng } }
    end

    assert_redirected_to jichucanshu_url(Jichucanshu.last)
  end

  test "should show jichucanshu" do
    get jichucanshu_url(@jichucanshu)
    assert_response :success
  end

  test "should get edit" do
    get edit_jichucanshu_url(@jichucanshu)
    assert_response :success
  end

  test "should update jichucanshu" do
    patch jichucanshu_url(@jichucanshu), params: { jichucanshu: { daimazhi1: @jichucanshu.daimazhi1, daimazhi2: @jichucanshu.daimazhi2, leixingdaima: @jichucanshu.leixingdaima, leixingmingcheng: @jichucanshu.leixingmingcheng } }
    assert_redirected_to jichucanshu_url(@jichucanshu)
  end

  test "should destroy jichucanshu" do
    assert_difference('Jichucanshu.count', -1) do
      delete jichucanshu_url(@jichucanshu)
    end

    assert_redirected_to jichucanshus_url
  end
end
