require 'test_helper'

class KaiguansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kaiguan = kaiguans(:one)
  end

  test "should get index" do
    get kaiguans_url
    assert_response :success
  end

  test "should get new" do
    get new_kaiguan_url
    assert_response :success
  end

  test "should create kaiguan" do
    assert_difference('Kaiguan.count') do
      post kaiguans_url, params: { kaiguan: { kaiqi: @kaiguan.kaiqi, xingming: @kaiguan.xingming } }
    end

    assert_redirected_to kaiguan_url(Kaiguan.last)
  end

  test "should show kaiguan" do
    get kaiguan_url(@kaiguan)
    assert_response :success
  end

  test "should get edit" do
    get edit_kaiguan_url(@kaiguan)
    assert_response :success
  end

  test "should update kaiguan" do
    patch kaiguan_url(@kaiguan), params: { kaiguan: { kaiqi: @kaiguan.kaiqi, xingming: @kaiguan.xingming } }
    assert_redirected_to kaiguan_url(@kaiguan)
  end

  test "should destroy kaiguan" do
    assert_difference('Kaiguan.count', -1) do
      delete kaiguan_url(@kaiguan)
    end

    assert_redirected_to kaiguans_url
  end
end
