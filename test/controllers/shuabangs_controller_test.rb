require 'test_helper'

class ShuabangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shuabang = shuabangs(:one)
  end

  test "should get index" do
    get shuabangs_url
    assert_response :success
  end

  test "should get new" do
    get new_shuabang_url
    assert_response :success
  end

  test "should create shuabang" do
    assert_difference('Shuabang.count') do
      post shuabangs_url, params: { shuabang: { appleshuliang: @shuabang.appleshuliang, appmingzi: @shuabang.appmingzi, beizhu: @shuabang.beizhu, guanjianci: @shuabang.guanjianci, laopaiming: @shuabang.laopaiming, paiming: @shuabang.paiming, shangshengshijian: @shuabang.shangshengshijian, shuabangshijian: @shuabang.shuabangshijian } }
    end

    assert_redirected_to shuabang_url(Shuabang.last)
  end

  test "should show shuabang" do
    get shuabang_url(@shuabang)
    assert_response :success
  end

  test "should get edit" do
    get edit_shuabang_url(@shuabang)
    assert_response :success
  end

  test "should update shuabang" do
    patch shuabang_url(@shuabang), params: { shuabang: { appleshuliang: @shuabang.appleshuliang, appmingzi: @shuabang.appmingzi, beizhu: @shuabang.beizhu, guanjianci: @shuabang.guanjianci, laopaiming: @shuabang.laopaiming, paiming: @shuabang.paiming, shangshengshijian: @shuabang.shangshengshijian, shuabangshijian: @shuabang.shuabangshijian } }
    assert_redirected_to shuabang_url(@shuabang)
  end

  test "should destroy shuabang" do
    assert_difference('Shuabang.count', -1) do
      delete shuabang_url(@shuabang)
    end

    assert_redirected_to shuabangs_url
  end
end
