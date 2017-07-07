require 'test_helper'

class JiankongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jiankong = jiankongs(:one)
  end

  test "should get index" do
    get jiankongs_url
    assert_response :success
  end

  test "should get new" do
    get new_jiankong_url
    assert_response :success
  end

  test "should create jiankong" do
    assert_difference('Jiankong.count') do
      post jiankongs_url, params: { jiankong: { fuwu_id: @jiankong.fuwu_id, miaoshu: @jiankong.miaoshu, mingzi: @jiankong.mingzi, script: @jiankong.script } }
    end

    assert_redirected_to jiankong_url(Jiankong.last)
  end

  test "should show jiankong" do
    get jiankong_url(@jiankong)
    assert_response :success
  end

  test "should get edit" do
    get edit_jiankong_url(@jiankong)
    assert_response :success
  end

  test "should update jiankong" do
    patch jiankong_url(@jiankong), params: { jiankong: { fuwu_id: @jiankong.fuwu_id, miaoshu: @jiankong.miaoshu, mingzi: @jiankong.mingzi, script: @jiankong.script } }
    assert_redirected_to jiankong_url(@jiankong)
  end

  test "should destroy jiankong" do
    assert_difference('Jiankong.count', -1) do
      delete jiankong_url(@jiankong)
    end

    assert_redirected_to jiankongs_url
  end
end
