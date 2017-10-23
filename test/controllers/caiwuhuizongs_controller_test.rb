require 'test_helper'

class CaiwuhuizongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caiwuhuizong = caiwuhuizongs(:one)
  end

  test "should get index" do
    get caiwuhuizongs_url
    assert_response :success
  end

  test "should get new" do
    get new_caiwuhuizong_url
    assert_response :success
  end

  test "should create caiwuhuizong" do
    assert_difference('Caiwuhuizong.count') do
      post caiwuhuizongs_url, params: { caiwuhuizong: { fangkuanjine: @caiwuhuizong.fangkuanjine, fangkuanlixi: @caiwuhuizong.fangkuanlixi, fangkuanzongbishu: @caiwuhuizong.fangkuanzongbishu, jietiaojine: @caiwuhuizong.jietiaojine, jietiaolixi: @caiwuhuizong.jietiaolixi, jietiaozongbishu: @caiwuhuizong.jietiaozongbishu, tongjileixing: @caiwuhuizong.tongjileixing, tongjiriqi: @caiwuhuizong.tongjiriqi, xujiejine: @caiwuhuizong.xujiejine, xujielixi: @caiwuhuizong.xujielixi, xujiezongbishu: @caiwuhuizong.xujiezongbishu, zongjine: @caiwuhuizong.zongjine } }
    end

    assert_redirected_to caiwuhuizong_url(Caiwuhuizong.last)
  end

  test "should show caiwuhuizong" do
    get caiwuhuizong_url(@caiwuhuizong)
    assert_response :success
  end

  test "should get edit" do
    get edit_caiwuhuizong_url(@caiwuhuizong)
    assert_response :success
  end

  test "should update caiwuhuizong" do
    patch caiwuhuizong_url(@caiwuhuizong), params: { caiwuhuizong: { fangkuanjine: @caiwuhuizong.fangkuanjine, fangkuanlixi: @caiwuhuizong.fangkuanlixi, fangkuanzongbishu: @caiwuhuizong.fangkuanzongbishu, jietiaojine: @caiwuhuizong.jietiaojine, jietiaolixi: @caiwuhuizong.jietiaolixi, jietiaozongbishu: @caiwuhuizong.jietiaozongbishu, tongjileixing: @caiwuhuizong.tongjileixing, tongjiriqi: @caiwuhuizong.tongjiriqi, xujiejine: @caiwuhuizong.xujiejine, xujielixi: @caiwuhuizong.xujielixi, xujiezongbishu: @caiwuhuizong.xujiezongbishu, zongjine: @caiwuhuizong.zongjine } }
    assert_redirected_to caiwuhuizong_url(@caiwuhuizong)
  end

  test "should destroy caiwuhuizong" do
    assert_difference('Caiwuhuizong.count', -1) do
      delete caiwuhuizong_url(@caiwuhuizong)
    end

    assert_redirected_to caiwuhuizongs_url
  end
end
