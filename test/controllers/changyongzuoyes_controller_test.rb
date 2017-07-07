require 'test_helper'

class ChangyongzuoyesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @changyongzuoye = changyongzuoyes(:one)
  end

  test "should get index" do
    get changyongzuoyes_url
    assert_response :success
  end

  test "should get new" do
    get new_changyongzuoye_url
    assert_response :success
  end

  test "should create changyongzuoye" do
    assert_difference('Changyongzuoye.count') do
      post changyongzuoyes_url, params: { changyongzuoye: { buzhoumingchen: @changyongzuoye.buzhoumingchen, fenleibiaoqian: @changyongzuoye.fenleibiaoqian, fuwuqishu: @changyongzuoye.fuwuqishu, jiaobencanshu: @changyongzuoye.jiaobencanshu, jiaobenmingchen: @changyongzuoye.jiaobenmingchen, quanjubianliangshezhi: @changyongzuoye.quanjubianliangshezhi, wanchenghouzhanting: @changyongzuoye.wanchenghouzhanting, zhixingzhanghu: @changyongzuoye.zhixingzhanghu, zuoyemingchen: @changyongzuoye.zuoyemingchen } }
    end

    assert_redirected_to changyongzuoye_url(Changyongzuoye.last)
  end

  test "should show changyongzuoye" do
    get changyongzuoye_url(@changyongzuoye)
    assert_response :success
  end

  test "should get edit" do
    get edit_changyongzuoye_url(@changyongzuoye)
    assert_response :success
  end

  test "should update changyongzuoye" do
    patch changyongzuoye_url(@changyongzuoye), params: { changyongzuoye: { buzhoumingchen: @changyongzuoye.buzhoumingchen, fenleibiaoqian: @changyongzuoye.fenleibiaoqian, fuwuqishu: @changyongzuoye.fuwuqishu, jiaobencanshu: @changyongzuoye.jiaobencanshu, jiaobenmingchen: @changyongzuoye.jiaobenmingchen, quanjubianliangshezhi: @changyongzuoye.quanjubianliangshezhi, wanchenghouzhanting: @changyongzuoye.wanchenghouzhanting, zhixingzhanghu: @changyongzuoye.zhixingzhanghu, zuoyemingchen: @changyongzuoye.zuoyemingchen } }
    assert_redirected_to changyongzuoye_url(@changyongzuoye)
  end

  test "should destroy changyongzuoye" do
    assert_difference('Changyongzuoye.count', -1) do
      delete changyongzuoye_url(@changyongzuoye)
    end

    assert_redirected_to changyongzuoyes_url
  end
end
