require 'test_helper'

class AndroidupdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @androidupdate = androidupdates(:one)
  end

  test "should get index" do
    get androidupdates_url
    assert_response :success
  end

  test "should get new" do
    get new_androidupdate_url
    assert_response :success
  end

  test "should create androidupdate" do
    assert_difference('Androidupdate.count') do
      post androidupdates_url, params: { androidupdate: { apkurl: @androidupdate.apkurl, fabushijian: @androidupdate.fabushijian, shichang: @androidupdate.shichang, summary: @androidupdate.summary, versioncode: @androidupdate.versioncode, versionname: @androidupdate.versionname } }
    end

    assert_redirected_to androidupdate_url(Androidupdate.last)
  end

  test "should show androidupdate" do
    get androidupdate_url(@androidupdate)
    assert_response :success
  end

  test "should get edit" do
    get edit_androidupdate_url(@androidupdate)
    assert_response :success
  end

  test "should update androidupdate" do
    patch androidupdate_url(@androidupdate), params: { androidupdate: { apkurl: @androidupdate.apkurl, fabushijian: @androidupdate.fabushijian, shichang: @androidupdate.shichang, summary: @androidupdate.summary, versioncode: @androidupdate.versioncode, versionname: @androidupdate.versionname } }
    assert_redirected_to androidupdate_url(@androidupdate)
  end

  test "should destroy androidupdate" do
    assert_difference('Androidupdate.count', -1) do
      delete androidupdate_url(@androidupdate)
    end

    assert_redirected_to androidupdates_url
  end
end
