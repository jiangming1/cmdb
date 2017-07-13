require 'test_helper'

class EsjiaobensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @esjiaoben = esjiaobens(:one)
  end

  test "should get index" do
    get esjiaobens_url
    assert_response :success
  end

  test "should get new" do
    get new_esjiaoben_url
    assert_response :success
  end

  test "should create esjiaoben" do
    assert_difference('Esjiaoben.count') do
      post esjiaobens_url, params: { esjiaoben: { beizhu: @esjiaoben.beizhu, jiaobenmingcheng: @esjiaoben.jiaobenmingcheng, jiaobenneirong: @esjiaoben.jiaobenneirong } }
    end

    assert_redirected_to esjiaoben_url(Esjiaoben.last)
  end

  test "should show esjiaoben" do
    get esjiaoben_url(@esjiaoben)
    assert_response :success
  end

  test "should get edit" do
    get edit_esjiaoben_url(@esjiaoben)
    assert_response :success
  end

  test "should update esjiaoben" do
    patch esjiaoben_url(@esjiaoben), params: { esjiaoben: { beizhu: @esjiaoben.beizhu, jiaobenmingcheng: @esjiaoben.jiaobenmingcheng, jiaobenneirong: @esjiaoben.jiaobenneirong } }
    assert_redirected_to esjiaoben_url(@esjiaoben)
  end

  test "should destroy esjiaoben" do
    assert_difference('Esjiaoben.count', -1) do
      delete esjiaoben_url(@esjiaoben)
    end

    assert_redirected_to esjiaobens_url
  end
end
