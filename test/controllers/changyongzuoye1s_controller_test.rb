require 'test_helper'

class Changyongzuoye1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @changyongzuoye1 = changyongzuoye1s(:one)
  end

  test "should get index" do
    get changyongzuoye1s_url
    assert_response :success
  end

  test "should get new" do
    get new_changyongzuoye1_url
    assert_response :success
  end

  test "should create changyongzuoye1" do
    assert_difference('Changyongzuoye1.count') do
      post changyongzuoye1s_url, params: { changyongzuoye1: { buzhoumingcheng: @changyongzuoye1.buzhoumingcheng, fenleibiaoqian: @changyongzuoye1.fenleibiaoqian, fuwuqishuliang: @changyongzuoye1.fuwuqishuliang, jiaobencanshu: @changyongzuoye1.jiaobencanshu, jiaobenmingcheng: @changyongzuoye1.jiaobenmingcheng, quanjubianliangshezhi: @changyongzuoye1.quanjubianliangshezhi, wanchenghouzanting: @changyongzuoye1.wanchenghouzanting, zhixingzhanghu: @changyongzuoye1.zhixingzhanghu, zuoyemingcheng: @changyongzuoye1.zuoyemingcheng } }
    end

    assert_redirected_to changyongzuoye1_url(Changyongzuoye1.last)
  end

  test "should show changyongzuoye1" do
    get changyongzuoye1_url(@changyongzuoye1)
    assert_response :success
  end

  test "should get edit" do
    get edit_changyongzuoye1_url(@changyongzuoye1)
    assert_response :success
  end

  test "should update changyongzuoye1" do
    patch changyongzuoye1_url(@changyongzuoye1), params: { changyongzuoye1: { buzhoumingcheng: @changyongzuoye1.buzhoumingcheng, fenleibiaoqian: @changyongzuoye1.fenleibiaoqian, fuwuqishuliang: @changyongzuoye1.fuwuqishuliang, jiaobencanshu: @changyongzuoye1.jiaobencanshu, jiaobenmingcheng: @changyongzuoye1.jiaobenmingcheng, quanjubianliangshezhi: @changyongzuoye1.quanjubianliangshezhi, wanchenghouzanting: @changyongzuoye1.wanchenghouzanting, zhixingzhanghu: @changyongzuoye1.zhixingzhanghu, zuoyemingcheng: @changyongzuoye1.zuoyemingcheng } }
    assert_redirected_to changyongzuoye1_url(@changyongzuoye1)
  end

  test "should destroy changyongzuoye1" do
    assert_difference('Changyongzuoye1.count', -1) do
      delete changyongzuoye1_url(@changyongzuoye1)
    end

    assert_redirected_to changyongzuoye1s_url
  end
end
