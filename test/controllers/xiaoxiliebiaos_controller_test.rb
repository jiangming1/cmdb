require 'test_helper'

class XiaoxiliebiaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xiaoxiliebiao = xiaoxiliebiaos(:one)
  end

  test "should get index" do
    get xiaoxiliebiaos_url
    assert_response :success
  end

  test "should get new" do
    get new_xiaoxiliebiao_url
    assert_response :success
  end

  test "should create xiaoxiliebiao" do
    assert_difference('Xiaoxiliebiao.count') do
      post xiaoxiliebiaos_url, params: { xiaoxiliebiao: { biaoti: @xiaoxiliebiao.biaoti, caozuo: @xiaoxiliebiao.caozuo, chuangjianshijian: @xiaoxiliebiao.chuangjianshijian, neirong: @xiaoxiliebiao.neirong, shoujihao: @xiaoxiliebiao.shoujihao, xiaoxileixing: @xiaoxiliebiao.xiaoxileixing, yonghuxingming: @xiaoxiliebiao.yonghuxingming } }
    end

    assert_redirected_to xiaoxiliebiao_url(Xiaoxiliebiao.last)
  end

  test "should show xiaoxiliebiao" do
    get xiaoxiliebiao_url(@xiaoxiliebiao)
    assert_response :success
  end

  test "should get edit" do
    get edit_xiaoxiliebiao_url(@xiaoxiliebiao)
    assert_response :success
  end

  test "should update xiaoxiliebiao" do
    patch xiaoxiliebiao_url(@xiaoxiliebiao), params: { xiaoxiliebiao: { biaoti: @xiaoxiliebiao.biaoti, caozuo: @xiaoxiliebiao.caozuo, chuangjianshijian: @xiaoxiliebiao.chuangjianshijian, neirong: @xiaoxiliebiao.neirong, shoujihao: @xiaoxiliebiao.shoujihao, xiaoxileixing: @xiaoxiliebiao.xiaoxileixing, yonghuxingming: @xiaoxiliebiao.yonghuxingming } }
    assert_redirected_to xiaoxiliebiao_url(@xiaoxiliebiao)
  end

  test "should destroy xiaoxiliebiao" do
    assert_difference('Xiaoxiliebiao.count', -1) do
      delete xiaoxiliebiao_url(@xiaoxiliebiao)
    end

    assert_redirected_to xiaoxiliebiaos_url
  end
end
