require 'test_helper'

class AnzhuoceshisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anzhuoceshi = anzhuoceshis(:one)
  end

  test "should get index" do
    get anzhuoceshis_url
    assert_response :success
  end

  test "should get new" do
    get new_anzhuoceshi_url
    assert_response :success
  end

  test "should create anzhuoceshi" do
    assert_difference('Anzhuoceshi.count') do
      post anzhuoceshis_url, params: { anzhuoceshi: { jiaoben: @anzhuoceshi.jiaoben, mingcheng: @anzhuoceshi.mingcheng } }
    end

    assert_redirected_to anzhuoceshi_url(Anzhuoceshi.last)
  end

  test "should show anzhuoceshi" do
    get anzhuoceshi_url(@anzhuoceshi)
    assert_response :success
  end

  test "should get edit" do
    get edit_anzhuoceshi_url(@anzhuoceshi)
    assert_response :success
  end

  test "should update anzhuoceshi" do
    patch anzhuoceshi_url(@anzhuoceshi), params: { anzhuoceshi: { jiaoben: @anzhuoceshi.jiaoben, mingcheng: @anzhuoceshi.mingcheng } }
    assert_redirected_to anzhuoceshi_url(@anzhuoceshi)
  end

  test "should destroy anzhuoceshi" do
    assert_difference('Anzhuoceshi.count', -1) do
      delete anzhuoceshi_url(@anzhuoceshi)
    end

    assert_redirected_to anzhuoceshis_url
  end
end
