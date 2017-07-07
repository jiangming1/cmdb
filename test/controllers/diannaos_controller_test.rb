require 'test_helper'

class DiannaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diannao = diannaos(:one)
  end

  test "should get index" do
    get diannaos_url
    assert_response :success
  end

  test "should get new" do
    get new_diannao_url
    assert_response :success
  end

  test "should create diannao" do
    assert_difference('Diannao.count') do
      post diannaos_url, params: { diannao: { ip: @diannao.ip, miaoshu: @diannao.miaoshu, mima: @diannao.mima, mingzi: @diannao.mingzi, neiip: @diannao.neiip, pubkey: @diannao.pubkey, yonghu: @diannao.yonghu } }
    end

    assert_redirected_to diannao_url(Diannao.last)
  end

  test "should show diannao" do
    get diannao_url(@diannao)
    assert_response :success
  end

  test "should get edit" do
    get edit_diannao_url(@diannao)
    assert_response :success
  end

  test "should update diannao" do
    patch diannao_url(@diannao), params: { diannao: { ip: @diannao.ip, miaoshu: @diannao.miaoshu, mima: @diannao.mima, mingzi: @diannao.mingzi, neiip: @diannao.neiip, pubkey: @diannao.pubkey, yonghu: @diannao.yonghu } }
    assert_redirected_to diannao_url(@diannao)
  end

  test "should destroy diannao" do
    assert_difference('Diannao.count', -1) do
      delete diannao_url(@diannao)
    end

    assert_redirected_to diannaos_url
  end
end
