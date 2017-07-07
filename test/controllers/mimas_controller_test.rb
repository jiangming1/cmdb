require 'test_helper'

class MimasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mima = mimas(:one)
  end

  test "should get index" do
    get mimas_url
    assert_response :success
  end

  test "should get new" do
    get new_mima_url
    assert_response :success
  end

  test "should create mima" do
    assert_difference('Mima.count') do
      post mimas_url, params: { mima: { miaoshu: @mima.miaoshu, mima: @mima.mima, mingzi: @mima.mingzi } }
    end

    assert_redirected_to mima_url(Mima.last)
  end

  test "should show mima" do
    get mima_url(@mima)
    assert_response :success
  end

  test "should get edit" do
    get edit_mima_url(@mima)
    assert_response :success
  end

  test "should update mima" do
    patch mima_url(@mima), params: { mima: { miaoshu: @mima.miaoshu, mima: @mima.mima, mingzi: @mima.mingzi } }
    assert_redirected_to mima_url(@mima)
  end

  test "should destroy mima" do
    assert_difference('Mima.count', -1) do
      delete mima_url(@mima)
    end

    assert_redirected_to mimas_url
  end
end
