require 'test_helper'

class DizhiguanlisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dizhiguanli = dizhiguanlis(:one)
  end

  test "should get index" do
    get dizhiguanlis_url
    assert_response :success
  end

  test "should get new" do
    get new_dizhiguanli_url
    assert_response :success
  end

  test "should create dizhiguanli" do
    assert_difference('Dizhiguanli.count') do
      post dizhiguanlis_url, params: { dizhiguanli: { daima: @dizhiguanli.daima, dengji: @dizhiguanli.dengji, jianpin: @dizhiguanli.jianpin, mingcheng: @dizhiguanli.mingcheng, paixu: @dizhiguanli.paixu, pinyin: @dizhiguanli.pinyin, shangjichengshi: @dizhiguanli.shangjichengshi } }
    end

    assert_redirected_to dizhiguanli_url(Dizhiguanli.last)
  end

  test "should show dizhiguanli" do
    get dizhiguanli_url(@dizhiguanli)
    assert_response :success
  end

  test "should get edit" do
    get edit_dizhiguanli_url(@dizhiguanli)
    assert_response :success
  end

  test "should update dizhiguanli" do
    patch dizhiguanli_url(@dizhiguanli), params: { dizhiguanli: { daima: @dizhiguanli.daima, dengji: @dizhiguanli.dengji, jianpin: @dizhiguanli.jianpin, mingcheng: @dizhiguanli.mingcheng, paixu: @dizhiguanli.paixu, pinyin: @dizhiguanli.pinyin, shangjichengshi: @dizhiguanli.shangjichengshi } }
    assert_redirected_to dizhiguanli_url(@dizhiguanli)
  end

  test "should destroy dizhiguanli" do
    assert_difference('Dizhiguanli.count', -1) do
      delete dizhiguanli_url(@dizhiguanli)
    end

    assert_redirected_to dizhiguanlis_url
  end
end
