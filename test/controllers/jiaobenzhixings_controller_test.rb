require 'test_helper'

class JiaobenzhixingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jiaobenzhixing = jiaobenzhixings(:one)
  end

  test "should get index" do
    get jiaobenzhixings_url
    assert_response :success
  end

  test "should get new" do
    get new_jiaobenzhixing_url
    assert_response :success
  end

  test "should create jiaobenzhixing" do
    assert_difference('Jiaobenzhixing.count') do
      post jiaobenzhixings_url, params: { jiaobenzhixing: { chaoshishijian: @jiaobenzhixing.chaoshishijian, jiaobencanshu: @jiaobenzhixing.jiaobencanshu, jiaobenmingcheng: @jiaobenzhixing.jiaobenmingcheng, jiaobenneirong: @jiaobenzhixing.jiaobenneirong, mubiaojiqi: @jiaobenzhixing.mubiaojiqi, zhixingzhanghu: @jiaobenzhixing.zhixingzhanghu } }
    end

    assert_redirected_to jiaobenzhixing_url(Jiaobenzhixing.last)
  end

  test "should show jiaobenzhixing" do
    get jiaobenzhixing_url(@jiaobenzhixing)
    assert_response :success
  end

  test "should get edit" do
    get edit_jiaobenzhixing_url(@jiaobenzhixing)
    assert_response :success
  end

  test "should update jiaobenzhixing" do
    patch jiaobenzhixing_url(@jiaobenzhixing), params: { jiaobenzhixing: { chaoshishijian: @jiaobenzhixing.chaoshishijian, jiaobencanshu: @jiaobenzhixing.jiaobencanshu, jiaobenmingcheng: @jiaobenzhixing.jiaobenmingcheng, jiaobenneirong: @jiaobenzhixing.jiaobenneirong, mubiaojiqi: @jiaobenzhixing.mubiaojiqi, zhixingzhanghu: @jiaobenzhixing.zhixingzhanghu } }
    assert_redirected_to jiaobenzhixing_url(@jiaobenzhixing)
  end

  test "should destroy jiaobenzhixing" do
    assert_difference('Jiaobenzhixing.count', -1) do
      delete jiaobenzhixing_url(@jiaobenzhixing)
    end

    assert_redirected_to jiaobenzhixings_url
  end
end
