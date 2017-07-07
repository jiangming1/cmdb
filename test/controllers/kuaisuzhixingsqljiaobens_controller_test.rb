require 'test_helper'

class KuaisuzhixingsqljiaobensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kuaisuzhixingsqljiaoben = kuaisuzhixingsqljiaobens(:one)
  end

  test "should get index" do
    get kuaisuzhixingsqljiaobens_url
    assert_response :success
  end

  test "should get new" do
    get new_kuaisuzhixingsqljiaoben_url
    assert_response :success
  end

  test "should create kuaisuzhixingsqljiaoben" do
    assert_difference('Kuaisuzhixingsqljiaoben.count') do
      post kuaisuzhixingsqljiaobens_url, params: { kuaisuzhixingsqljiaoben: { chaoshishijian: @kuaisuzhixingsqljiaoben.chaoshishijian, dbzhanghaobieming: @kuaisuzhixingsqljiaoben.dbzhanghaobieming, jiaobenmingchen: @kuaisuzhixingsqljiaoben.jiaobenmingchen, jiaobenneirong: @kuaisuzhixingsqljiaoben.jiaobenneirong, mubiaojiqi: @kuaisuzhixingsqljiaoben.mubiaojiqi } }
    end

    assert_redirected_to kuaisuzhixingsqljiaoben_url(Kuaisuzhixingsqljiaoben.last)
  end

  test "should show kuaisuzhixingsqljiaoben" do
    get kuaisuzhixingsqljiaoben_url(@kuaisuzhixingsqljiaoben)
    assert_response :success
  end

  test "should get edit" do
    get edit_kuaisuzhixingsqljiaoben_url(@kuaisuzhixingsqljiaoben)
    assert_response :success
  end

  test "should update kuaisuzhixingsqljiaoben" do
    patch kuaisuzhixingsqljiaoben_url(@kuaisuzhixingsqljiaoben), params: { kuaisuzhixingsqljiaoben: { chaoshishijian: @kuaisuzhixingsqljiaoben.chaoshishijian, dbzhanghaobieming: @kuaisuzhixingsqljiaoben.dbzhanghaobieming, jiaobenmingchen: @kuaisuzhixingsqljiaoben.jiaobenmingchen, jiaobenneirong: @kuaisuzhixingsqljiaoben.jiaobenneirong, mubiaojiqi: @kuaisuzhixingsqljiaoben.mubiaojiqi } }
    assert_redirected_to kuaisuzhixingsqljiaoben_url(@kuaisuzhixingsqljiaoben)
  end

  test "should destroy kuaisuzhixingsqljiaoben" do
    assert_difference('Kuaisuzhixingsqljiaoben.count', -1) do
      delete kuaisuzhixingsqljiaoben_url(@kuaisuzhixingsqljiaoben)
    end

    assert_redirected_to kuaisuzhixingsqljiaobens_url
  end
end
