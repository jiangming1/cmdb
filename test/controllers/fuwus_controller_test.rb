require 'test_helper'

class FuwusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fuwu = fuwus(:one)
  end

  test "should get index" do
    get fuwus_url
    assert_response :success
  end

  test "should get new" do
    get new_fuwu_url
    assert_response :success
  end

  test "should create fuwu" do
    assert_difference('Fuwu.count') do
      post fuwus_url, params: { fuwu: { diannao_id: @fuwu.diannao_id, miaoshu: @fuwu.miaoshu, mingzi: @fuwu.mingzi, port: @fuwu.port, svn: @fuwu.svn } }
    end

    assert_redirected_to fuwu_url(Fuwu.last)
  end

  test "should show fuwu" do
    get fuwu_url(@fuwu)
    assert_response :success
  end

  test "should get edit" do
    get edit_fuwu_url(@fuwu)
    assert_response :success
  end

  test "should update fuwu" do
    patch fuwu_url(@fuwu), params: { fuwu: { diannao_id: @fuwu.diannao_id, miaoshu: @fuwu.miaoshu, mingzi: @fuwu.mingzi, port: @fuwu.port, svn: @fuwu.svn } }
    assert_redirected_to fuwu_url(@fuwu)
  end

  test "should destroy fuwu" do
    assert_difference('Fuwu.count', -1) do
      delete fuwu_url(@fuwu)
    end

    assert_redirected_to fuwus_url
  end
end
