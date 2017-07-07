require 'test_helper'

class PingguodingshirenwusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pingguodingshirenwu = pingguodingshirenwus(:one)
  end

  test "should get index" do
    get pingguodingshirenwus_url
    assert_response :success
  end

  test "should get new" do
    get new_pingguodingshirenwu_url
    assert_response :success
  end

  test "should create pingguodingshirenwu" do
    assert_difference('Pingguodingshirenwu.count') do
      post pingguodingshirenwus_url, params: { pingguodingshirenwu: { beizhu: @pingguodingshirenwu.beizhu, chengxumingcheng: @pingguodingshirenwu.chengxumingcheng, dijiming: @pingguodingshirenwu.dijiming, guanjianci: @pingguodingshirenwu.guanjianci } }
    end

    assert_redirected_to pingguodingshirenwu_url(Pingguodingshirenwu.last)
  end

  test "should show pingguodingshirenwu" do
    get pingguodingshirenwu_url(@pingguodingshirenwu)
    assert_response :success
  end

  test "should get edit" do
    get edit_pingguodingshirenwu_url(@pingguodingshirenwu)
    assert_response :success
  end

  test "should update pingguodingshirenwu" do
    patch pingguodingshirenwu_url(@pingguodingshirenwu), params: { pingguodingshirenwu: { beizhu: @pingguodingshirenwu.beizhu, chengxumingcheng: @pingguodingshirenwu.chengxumingcheng, dijiming: @pingguodingshirenwu.dijiming, guanjianci: @pingguodingshirenwu.guanjianci } }
    assert_redirected_to pingguodingshirenwu_url(@pingguodingshirenwu)
  end

  test "should destroy pingguodingshirenwu" do
    assert_difference('Pingguodingshirenwu.count', -1) do
      delete pingguodingshirenwu_url(@pingguodingshirenwu)
    end

    assert_redirected_to pingguodingshirenwus_url
  end
end
