require 'test_helper'

class TuiguangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tuiguang = tuiguangs(:one)
  end

  test "should get index" do
    get tuiguangs_url
    assert_response :success
  end

  test "should get new" do
    get new_tuiguang_url
    assert_response :success
  end

  test "should create tuiguang" do
    assert_difference('Tuiguang.count') do
      post tuiguangs_url, params: { tuiguang: { dangefangkuangjianglijinbaifenbi: @tuiguang.dangefangkuangjianglijinbaifenbi, dangefangkuanjianglijinjine: @tuiguang.dangefangkuanjianglijinjine, dangezhucejianglijin: @tuiguang.dangezhucejianglijin, dangeziliaowanshanjianglijin: @tuiguang.dangeziliaowanshanjianglijin, dangqianzhuangtai: @tuiguang.dangqianzhuangtai, tuiguangfangmingcheng: @tuiguang.tuiguangfangmingcheng } }
    end

    assert_redirected_to tuiguang_url(Tuiguang.last)
  end

  test "should show tuiguang" do
    get tuiguang_url(@tuiguang)
    assert_response :success
  end

  test "should get edit" do
    get edit_tuiguang_url(@tuiguang)
    assert_response :success
  end

  test "should update tuiguang" do
    patch tuiguang_url(@tuiguang), params: { tuiguang: { dangefangkuangjianglijinbaifenbi: @tuiguang.dangefangkuangjianglijinbaifenbi, dangefangkuanjianglijinjine: @tuiguang.dangefangkuanjianglijinjine, dangezhucejianglijin: @tuiguang.dangezhucejianglijin, dangeziliaowanshanjianglijin: @tuiguang.dangeziliaowanshanjianglijin, dangqianzhuangtai: @tuiguang.dangqianzhuangtai, tuiguangfangmingcheng: @tuiguang.tuiguangfangmingcheng } }
    assert_redirected_to tuiguang_url(@tuiguang)
  end

  test "should destroy tuiguang" do
    assert_difference('Tuiguang.count', -1) do
      delete tuiguang_url(@tuiguang)
    end

    assert_redirected_to tuiguangs_url
  end
end
