require 'test_helper'

class YifangkuansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yifangkuan = yifangkuans(:one)
  end

  test "should get index" do
    get yifangkuans_url
    assert_response :success
  end

  test "should get new" do
    get new_yifangkuan_url
    assert_response :success
  end

  test "should create yifangkuan" do
    assert_difference('Yifangkuan.count') do
      post yifangkuans_url, params: { yifangkuan: { cehui: @yifangkuan.cehui, fangkuanshijian: @yifangkuan.fangkuanshijian, jiekuanjine: @yifangkuan.jiekuanjine, jiekuanlixi: @yifangkuan.jiekuanlixi, jiekuanqixian: @yifangkuan.jiekuanqixian, jiekuanshijian: @yifangkuan.jiekuanshijian, shoujihao: @yifangkuan.shoujihao, xingming: @yifangkuan.xingming } }
    end

    assert_redirected_to yifangkuan_url(Yifangkuan.last)
  end

  test "should show yifangkuan" do
    get yifangkuan_url(@yifangkuan)
    assert_response :success
  end

  test "should get edit" do
    get edit_yifangkuan_url(@yifangkuan)
    assert_response :success
  end

  test "should update yifangkuan" do
    patch yifangkuan_url(@yifangkuan), params: { yifangkuan: { cehui: @yifangkuan.cehui, fangkuanshijian: @yifangkuan.fangkuanshijian, jiekuanjine: @yifangkuan.jiekuanjine, jiekuanlixi: @yifangkuan.jiekuanlixi, jiekuanqixian: @yifangkuan.jiekuanqixian, jiekuanshijian: @yifangkuan.jiekuanshijian, shoujihao: @yifangkuan.shoujihao, xingming: @yifangkuan.xingming } }
    assert_redirected_to yifangkuan_url(@yifangkuan)
  end

  test "should destroy yifangkuan" do
    assert_difference('Yifangkuan.count', -1) do
      delete yifangkuan_url(@yifangkuan)
    end

    assert_redirected_to yifangkuans_url
  end
end
