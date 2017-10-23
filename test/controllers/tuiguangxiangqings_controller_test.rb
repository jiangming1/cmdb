require 'test_helper'

class TuiguangxiangqingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tuiguangxiangqing = tuiguangxiangqings(:one)
  end

  test "should get index" do
    get tuiguangxiangqings_url
    assert_response :success
  end

  test "should get new" do
    get new_tuiguangxiangqing_url
    assert_response :success
  end

  test "should create tuiguangxiangqing" do
    assert_difference('Tuiguangxiangqing.count') do
      post tuiguangxiangqings_url, params: { tuiguangxiangqing: { fangkuanjine: @tuiguangxiangqing.fangkuanjine, fangkuanshu: @tuiguangxiangqing.fangkuanshu, shenqingshu: @tuiguangxiangqing.shenqingshu, tongjiriqi: @tuiguangxiangqing.tongjiriqi, tuiguangmingcheng: @tuiguangxiangqing.tuiguangmingcheng, zhuceshu: @tuiguangxiangqing.zhuceshu, zuihoushuaxinshijian: @tuiguangxiangqing.zuihoushuaxinshijian } }
    end

    assert_redirected_to tuiguangxiangqing_url(Tuiguangxiangqing.last)
  end

  test "should show tuiguangxiangqing" do
    get tuiguangxiangqing_url(@tuiguangxiangqing)
    assert_response :success
  end

  test "should get edit" do
    get edit_tuiguangxiangqing_url(@tuiguangxiangqing)
    assert_response :success
  end

  test "should update tuiguangxiangqing" do
    patch tuiguangxiangqing_url(@tuiguangxiangqing), params: { tuiguangxiangqing: { fangkuanjine: @tuiguangxiangqing.fangkuanjine, fangkuanshu: @tuiguangxiangqing.fangkuanshu, shenqingshu: @tuiguangxiangqing.shenqingshu, tongjiriqi: @tuiguangxiangqing.tongjiriqi, tuiguangmingcheng: @tuiguangxiangqing.tuiguangmingcheng, zhuceshu: @tuiguangxiangqing.zhuceshu, zuihoushuaxinshijian: @tuiguangxiangqing.zuihoushuaxinshijian } }
    assert_redirected_to tuiguangxiangqing_url(@tuiguangxiangqing)
  end

  test "should destroy tuiguangxiangqing" do
    assert_difference('Tuiguangxiangqing.count', -1) do
      delete tuiguangxiangqing_url(@tuiguangxiangqing)
    end

    assert_redirected_to tuiguangxiangqings_url
  end
end
