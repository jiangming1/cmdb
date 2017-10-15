require 'test_helper'

class XujiedaifangkuanliebiaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xujiedaifangkuanliebiao = xujiedaifangkuanliebiaos(:one)
  end

  test "should get index" do
    get xujiedaifangkuanliebiaos_url
    assert_response :success
  end

  test "should get new" do
    get new_xujiedaifangkuanliebiao_url
    assert_response :success
  end

  test "should create xujiedaifangkuanliebiao" do
    assert_difference('Xujiedaifangkuanliebiao.count') do
      post xujiedaifangkuanliebiaos_url, params: { xujiedaifangkuanliebiao: { jiekuanjine: @xujiedaifangkuanliebiao.jiekuanjine, jiekuanlixi: @xujiedaifangkuanliebiao.jiekuanlixi, jiekuanqixian: @xujiedaifangkuanliebiao.jiekuanqixian, jiekuanshijian: @xujiedaifangkuanliebiao.jiekuanshijian, shenheren: @xujiedaifangkuanliebiao.shenheren, shenheshijian: @xujiedaifangkuanliebiao.shenheshijian, shoujihao: @xujiedaifangkuanliebiao.shoujihao, tongguo: @xujiedaifangkuanliebiao.tongguo, xingming: @xujiedaifangkuanliebiao.xingming, xujie: @xujiedaifangkuanliebiao.xujie } }
    end

    assert_redirected_to xujiedaifangkuanliebiao_url(Xujiedaifangkuanliebiao.last)
  end

  test "should show xujiedaifangkuanliebiao" do
    get xujiedaifangkuanliebiao_url(@xujiedaifangkuanliebiao)
    assert_response :success
  end

  test "should get edit" do
    get edit_xujiedaifangkuanliebiao_url(@xujiedaifangkuanliebiao)
    assert_response :success
  end

  test "should update xujiedaifangkuanliebiao" do
    patch xujiedaifangkuanliebiao_url(@xujiedaifangkuanliebiao), params: { xujiedaifangkuanliebiao: { jiekuanjine: @xujiedaifangkuanliebiao.jiekuanjine, jiekuanlixi: @xujiedaifangkuanliebiao.jiekuanlixi, jiekuanqixian: @xujiedaifangkuanliebiao.jiekuanqixian, jiekuanshijian: @xujiedaifangkuanliebiao.jiekuanshijian, shenheren: @xujiedaifangkuanliebiao.shenheren, shenheshijian: @xujiedaifangkuanliebiao.shenheshijian, shoujihao: @xujiedaifangkuanliebiao.shoujihao, tongguo: @xujiedaifangkuanliebiao.tongguo, xingming: @xujiedaifangkuanliebiao.xingming, xujie: @xujiedaifangkuanliebiao.xujie } }
    assert_redirected_to xujiedaifangkuanliebiao_url(@xujiedaifangkuanliebiao)
  end

  test "should destroy xujiedaifangkuanliebiao" do
    assert_difference('Xujiedaifangkuanliebiao.count', -1) do
      delete xujiedaifangkuanliebiao_url(@xujiedaifangkuanliebiao)
    end

    assert_redirected_to xujiedaifangkuanliebiaos_url
  end
end
