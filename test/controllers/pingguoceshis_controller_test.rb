require 'test_helper'

class PingguoceshisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pingguoceshi = pingguoceshis(:one)
  end

  test "should get index" do
    get pingguoceshis_url
    assert_response :success
  end

  test "should get new" do
    get new_pingguoceshi_url
    assert_response :success
  end

  test "should create pingguoceshi" do
    assert_difference('Pingguoceshi.count') do
      post pingguoceshis_url, params: { pingguoceshi: { jiaoben: @pingguoceshi.jiaoben, mingcheng: @pingguoceshi.mingcheng } }
    end

    assert_redirected_to pingguoceshi_url(Pingguoceshi.last)
  end

  test "should show pingguoceshi" do
    get pingguoceshi_url(@pingguoceshi)
    assert_response :success
  end

  test "should get edit" do
    get edit_pingguoceshi_url(@pingguoceshi)
    assert_response :success
  end

  test "should update pingguoceshi" do
    patch pingguoceshi_url(@pingguoceshi), params: { pingguoceshi: { jiaoben: @pingguoceshi.jiaoben, mingcheng: @pingguoceshi.mingcheng } }
    assert_redirected_to pingguoceshi_url(@pingguoceshi)
  end

  test "should destroy pingguoceshi" do
    assert_difference('Pingguoceshi.count', -1) do
      delete pingguoceshi_url(@pingguoceshi)
    end

    assert_redirected_to pingguoceshis_url
  end
end
