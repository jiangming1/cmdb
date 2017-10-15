require 'test_helper'

class XinyonghudaifangkuanliebiaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xinyonghudaifangkuanliebiao = xinyonghudaifangkuanliebiaos(:one)
  end

  test "should get index" do
    get xinyonghudaifangkuanliebiaos_url
    assert_response :success
  end

  test "should get new" do
    get new_xinyonghudaifangkuanliebiao_url
    assert_response :success
  end

  test "should create xinyonghudaifangkuanliebiao" do
    assert_difference('Xinyonghudaifangkuanliebiao.count') do
      post xinyonghudaifangkuanliebiaos_url, params: { xinyonghudaifangkuanliebiao: { jiekuanjine: @xinyonghudaifangkuanliebiao.jiekuanjine, jiekuanlixi: @xinyonghudaifangkuanliebiao.jiekuanlixi, jiekuanqixian: @xinyonghudaifangkuanliebiao.jiekuanqixian, jiekuanshijian: @xinyonghudaifangkuanliebiao.jiekuanshijian, shenheren: @xinyonghudaifangkuanliebiao.shenheren, shoujihao: @xinyonghudaifangkuanliebiao.shoujihao, xingming: @xinyonghudaifangkuanliebiao.xingming } }
    end

    assert_redirected_to xinyonghudaifangkuanliebiao_url(Xinyonghudaifangkuanliebiao.last)
  end

  test "should show xinyonghudaifangkuanliebiao" do
    get xinyonghudaifangkuanliebiao_url(@xinyonghudaifangkuanliebiao)
    assert_response :success
  end

  test "should get edit" do
    get edit_xinyonghudaifangkuanliebiao_url(@xinyonghudaifangkuanliebiao)
    assert_response :success
  end

  test "should update xinyonghudaifangkuanliebiao" do
    patch xinyonghudaifangkuanliebiao_url(@xinyonghudaifangkuanliebiao), params: { xinyonghudaifangkuanliebiao: { jiekuanjine: @xinyonghudaifangkuanliebiao.jiekuanjine, jiekuanlixi: @xinyonghudaifangkuanliebiao.jiekuanlixi, jiekuanqixian: @xinyonghudaifangkuanliebiao.jiekuanqixian, jiekuanshijian: @xinyonghudaifangkuanliebiao.jiekuanshijian, shenheren: @xinyonghudaifangkuanliebiao.shenheren, shoujihao: @xinyonghudaifangkuanliebiao.shoujihao, xingming: @xinyonghudaifangkuanliebiao.xingming } }
    assert_redirected_to xinyonghudaifangkuanliebiao_url(@xinyonghudaifangkuanliebiao)
  end

  test "should destroy xinyonghudaifangkuanliebiao" do
    assert_difference('Xinyonghudaifangkuanliebiao.count', -1) do
      delete xinyonghudaifangkuanliebiao_url(@xinyonghudaifangkuanliebiao)
    end

    assert_redirected_to xinyonghudaifangkuanliebiaos_url
  end
end
