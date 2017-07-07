require 'test_helper'

class CeshirenwuguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ceshirenwuguanli = ceshirenwuguanlis(:one)
  end

  test "should get index" do
    get ceshirenwuguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_ceshirenwuguanli_url
    assert_response :success
  end

  test "should create ceshirenwuguanli" do
    assert_difference('Ceshirenwuguanli.count') do
      post ceshirenwuguanlis_url, params: { ceshirenwuguanli: { ceshijieguo: @ceshirenwuguanli.ceshijieguo, ceshileixing: @ceshirenwuguanli.ceshileixing, ceshixiang: @ceshirenwuguanli.ceshixiang, chuangjianshijian: @ceshirenwuguanli.chuangjianshijian, jiaobenmingcheng: @ceshirenwuguanli.jiaobenmingcheng, zhuangtai: @ceshirenwuguanli.zhuangtai } }
    end

    assert_redirected_to ceshirenwuguanli_url(Ceshirenwuguanli.last)
  end

  test "should show ceshirenwuguanli" do
    get ceshirenwuguanli_url(@ceshirenwuguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_ceshirenwuguanli_url(@ceshirenwuguanli)
    assert_response :success
  end

  test "should update ceshirenwuguanli" do
    patch ceshirenwuguanli_url(@ceshirenwuguanli), params: { ceshirenwuguanli: { ceshijieguo: @ceshirenwuguanli.ceshijieguo, ceshileixing: @ceshirenwuguanli.ceshileixing, ceshixiang: @ceshirenwuguanli.ceshixiang, chuangjianshijian: @ceshirenwuguanli.chuangjianshijian, jiaobenmingcheng: @ceshirenwuguanli.jiaobenmingcheng, zhuangtai: @ceshirenwuguanli.zhuangtai } }
    assert_redirected_to ceshirenwuguanli_url(@ceshirenwuguanli)
  end

  test "should destroy ceshirenwuguanli" do
    assert_difference('Ceshirenwuguanli.count', -1) do
      delete ceshirenwuguanli_url(@ceshirenwuguanli)
    end

    assert_redirected_to ceshirenwuguanlis_url
  end
end
