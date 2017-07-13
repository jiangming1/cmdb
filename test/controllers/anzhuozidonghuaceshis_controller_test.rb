require 'test_helper'

class AnzhuozidonghuaceshisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anzhuozidonghuaceshi = anzhuozidonghuaceshis(:one)
  end

  test "should get index" do
    get anzhuozidonghuaceshis_url
    assert_response :success
  end

  test "should get new" do
    get new_anzhuozidonghuaceshi_url
    assert_response :success
  end

  test "should create anzhuozidonghuaceshi" do
    assert_difference('Anzhuozidonghuaceshi.count') do
      post anzhuozidonghuaceshis_url, params: { anzhuozidonghuaceshi: { jiaoben: @anzhuozidonghuaceshi.jiaoben, mingcheng: @anzhuozidonghuaceshi.mingcheng } }
    end

    assert_redirected_to anzhuozidonghuaceshi_url(Anzhuozidonghuaceshi.last)
  end

  test "should show anzhuozidonghuaceshi" do
    get anzhuozidonghuaceshi_url(@anzhuozidonghuaceshi)
    assert_response :success
  end

  test "should get edit" do
    get edit_anzhuozidonghuaceshi_url(@anzhuozidonghuaceshi)
    assert_response :success
  end

  test "should update anzhuozidonghuaceshi" do
    patch anzhuozidonghuaceshi_url(@anzhuozidonghuaceshi), params: { anzhuozidonghuaceshi: { jiaoben: @anzhuozidonghuaceshi.jiaoben, mingcheng: @anzhuozidonghuaceshi.mingcheng } }
    assert_redirected_to anzhuozidonghuaceshi_url(@anzhuozidonghuaceshi)
  end

  test "should destroy anzhuozidonghuaceshi" do
    assert_difference('Anzhuozidonghuaceshi.count', -1) do
      delete anzhuozidonghuaceshi_url(@anzhuozidonghuaceshi)
    end

    assert_redirected_to anzhuozidonghuaceshis_url
  end
end
