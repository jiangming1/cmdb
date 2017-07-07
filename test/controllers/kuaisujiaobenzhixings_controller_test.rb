require 'test_helper'

class KuaisujiaobenzhixingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kuaisujiaobenzhixing = kuaisujiaobenzhixings(:one)
  end

  test "should get index" do
    get kuaisujiaobenzhixings_url
    assert_response :success
  end

  test "should get new" do
    get new_kuaisujiaobenzhixing_url
    assert_response :success
  end

  test "should create kuaisujiaobenzhixing" do
    assert_difference('Kuaisujiaobenzhixing.count') do
      post kuaisujiaobenzhixings_url, params: { kuaisujiaobenzhixing: { chaoshishijian: @kuaisujiaobenzhixing.chaoshishijian, jiaobencanshu: @kuaisujiaobenzhixing.jiaobencanshu, jiaobenlaiyuan: @kuaisujiaobenzhixing.jiaobenlaiyuan, jiaobenmingchen: @kuaisujiaobenzhixing.jiaobenmingchen, jiaobenneirong: @kuaisujiaobenzhixing.jiaobenneirong, mubiaojiqi: @kuaisujiaobenzhixing.mubiaojiqi, zhixingzhanghu: @kuaisujiaobenzhixing.zhixingzhanghu } }
    end

    assert_redirected_to kuaisujiaobenzhixing_url(Kuaisujiaobenzhixing.last)
  end

  test "should show kuaisujiaobenzhixing" do
    get kuaisujiaobenzhixing_url(@kuaisujiaobenzhixing)
    assert_response :success
  end

  test "should get edit" do
    get edit_kuaisujiaobenzhixing_url(@kuaisujiaobenzhixing)
    assert_response :success
  end

  test "should update kuaisujiaobenzhixing" do
    patch kuaisujiaobenzhixing_url(@kuaisujiaobenzhixing), params: { kuaisujiaobenzhixing: { chaoshishijian: @kuaisujiaobenzhixing.chaoshishijian, jiaobencanshu: @kuaisujiaobenzhixing.jiaobencanshu, jiaobenlaiyuan: @kuaisujiaobenzhixing.jiaobenlaiyuan, jiaobenmingchen: @kuaisujiaobenzhixing.jiaobenmingchen, jiaobenneirong: @kuaisujiaobenzhixing.jiaobenneirong, mubiaojiqi: @kuaisujiaobenzhixing.mubiaojiqi, zhixingzhanghu: @kuaisujiaobenzhixing.zhixingzhanghu } }
    assert_redirected_to kuaisujiaobenzhixing_url(@kuaisujiaobenzhixing)
  end

  test "should destroy kuaisujiaobenzhixing" do
    assert_difference('Kuaisujiaobenzhixing.count', -1) do
      delete kuaisujiaobenzhixing_url(@kuaisujiaobenzhixing)
    end

    assert_redirected_to kuaisujiaobenzhixings_url
  end
end
