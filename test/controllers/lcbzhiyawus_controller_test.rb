require 'test_helper'

class LcbzhiyawusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lcbzhiyawu = lcbzhiyawus(:one)
  end

  test "should get index" do
    get lcbzhiyawus_url
    assert_response :success
  end

  test "should get new" do
    get new_lcbzhiyawu_url
    assert_response :success
  end

  test "should create lcbzhiyawu" do
    assert_difference('Lcbzhiyawu.count') do
      post lcbzhiyawus_url, params: { lcbzhiyawu: { cunkuanqixian: @lcbzhiyawu.cunkuanqixian, lilv: @lcbzhiyawu.lilv, mingcheng: @lcbzhiyawu.mingcheng, mubiaojine: @lcbzhiyawu.mubiaojine, mujijine: @lcbzhiyawu.mujijine, zhuangtai: @lcbzhiyawu.zhuangtai, zuixiaoine: @lcbzhiyawu.zuixiaoine } }
    end

    assert_redirected_to lcbzhiyawu_url(Lcbzhiyawu.last)
  end

  test "should show lcbzhiyawu" do
    get lcbzhiyawu_url(@lcbzhiyawu)
    assert_response :success
  end

  test "should get edit" do
    get edit_lcbzhiyawu_url(@lcbzhiyawu)
    assert_response :success
  end

  test "should update lcbzhiyawu" do
    patch lcbzhiyawu_url(@lcbzhiyawu), params: { lcbzhiyawu: { cunkuanqixian: @lcbzhiyawu.cunkuanqixian, lilv: @lcbzhiyawu.lilv, mingcheng: @lcbzhiyawu.mingcheng, mubiaojine: @lcbzhiyawu.mubiaojine, mujijine: @lcbzhiyawu.mujijine, zhuangtai: @lcbzhiyawu.zhuangtai, zuixiaoine: @lcbzhiyawu.zuixiaoine } }
    assert_redirected_to lcbzhiyawu_url(@lcbzhiyawu)
  end

  test "should destroy lcbzhiyawu" do
    assert_difference('Lcbzhiyawu.count', -1) do
      delete lcbzhiyawu_url(@lcbzhiyawu)
    end

    assert_redirected_to lcbzhiyawus_url
  end
end
