require 'test_helper'

class WebceshisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webceshi = webceshis(:one)
  end

  test "should get index" do
    get webceshis_url
    assert_response :success
  end

  test "should get new" do
    get new_webceshi_url
    assert_response :success
  end

  test "should create webceshi" do
    assert_difference('Webceshi.count') do
      post webceshis_url, params: { webceshi: { jiaoben: @webceshi.jiaoben, mingcheng: @webceshi.mingcheng } }
    end

    assert_redirected_to webceshi_url(Webceshi.last)
  end

  test "should show webceshi" do
    get webceshi_url(@webceshi)
    assert_response :success
  end

  test "should get edit" do
    get edit_webceshi_url(@webceshi)
    assert_response :success
  end

  test "should update webceshi" do
    patch webceshi_url(@webceshi), params: { webceshi: { jiaoben: @webceshi.jiaoben, mingcheng: @webceshi.mingcheng } }
    assert_redirected_to webceshi_url(@webceshi)
  end

  test "should destroy webceshi" do
    assert_difference('Webceshi.count', -1) do
      delete webceshi_url(@webceshi)
    end

    assert_redirected_to webceshis_url
  end
end
