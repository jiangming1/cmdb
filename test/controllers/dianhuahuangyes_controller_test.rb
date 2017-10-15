require 'test_helper'

class DianhuahuangyesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dianhuahuangye = dianhuahuangyes(:one)
  end

  test "should get index" do
    get dianhuahuangyes_url
    assert_response :success
  end

  test "should get new" do
    get new_dianhuahuangye_url
    assert_response :success
  end

  test "should create dianhuahuangye" do
    assert_difference('Dianhuahuangye.count') do
      post dianhuahuangyes_url, params: { dianhuahuangye: { dianhuahaoma: @dianhuahuangye.dianhuahaoma, guanzhuchengdu: @dianhuahuangye.guanzhuchengdu, mingcheng: @dianhuahuangye.mingcheng, shuoming: @dianhuahuangye.shuoming } }
    end

    assert_redirected_to dianhuahuangye_url(Dianhuahuangye.last)
  end

  test "should show dianhuahuangye" do
    get dianhuahuangye_url(@dianhuahuangye)
    assert_response :success
  end

  test "should get edit" do
    get edit_dianhuahuangye_url(@dianhuahuangye)
    assert_response :success
  end

  test "should update dianhuahuangye" do
    patch dianhuahuangye_url(@dianhuahuangye), params: { dianhuahuangye: { dianhuahaoma: @dianhuahuangye.dianhuahaoma, guanzhuchengdu: @dianhuahuangye.guanzhuchengdu, mingcheng: @dianhuahuangye.mingcheng, shuoming: @dianhuahuangye.shuoming } }
    assert_redirected_to dianhuahuangye_url(@dianhuahuangye)
  end

  test "should destroy dianhuahuangye" do
    assert_difference('Dianhuahuangye.count', -1) do
      delete dianhuahuangye_url(@dianhuahuangye)
    end

    assert_redirected_to dianhuahuangyes_url
  end
end
