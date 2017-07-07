require 'test_helper'

class YumingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yuming = yumings(:one)
  end

  test "should get index" do
    get yumings_url
    assert_response :success
  end

  test "should get new" do
    get new_yuming_url
    assert_response :success
  end

  test "should create yuming" do
    assert_difference('Yuming.count') do
      post yumings_url, params: { yuming: { ip: @yuming.ip, miaoshu: @yuming.miaoshu, mingzi: @yuming.mingzi } }
    end

    assert_redirected_to yuming_url(Yuming.last)
  end

  test "should show yuming" do
    get yuming_url(@yuming)
    assert_response :success
  end

  test "should get edit" do
    get edit_yuming_url(@yuming)
    assert_response :success
  end

  test "should update yuming" do
    patch yuming_url(@yuming), params: { yuming: { ip: @yuming.ip, miaoshu: @yuming.miaoshu, mingzi: @yuming.mingzi } }
    assert_redirected_to yuming_url(@yuming)
  end

  test "should destroy yuming" do
    assert_difference('Yuming.count', -1) do
      delete yuming_url(@yuming)
    end

    assert_redirected_to yumings_url
  end
end
