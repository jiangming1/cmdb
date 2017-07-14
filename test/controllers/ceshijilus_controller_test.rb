require 'test_helper'

class CeshijilusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ceshijilu = ceshijilus(:one)
  end

  test "should get index" do
    get ceshijilus_url
    assert_response :success
  end

  test "should get new" do
    get new_ceshijilu_url
    assert_response :success
  end

  test "should create ceshijilu" do
    assert_difference('Ceshijilu.count') do
      post ceshijilus_url, params: { ceshijilu: { beizhu: @ceshijilu.beizhu, jiaoben: @ceshijilu.jiaoben, mingcheng: @ceshijilu.mingcheng } }
    end

    assert_redirected_to ceshijilu_url(Ceshijilu.last)
  end

  test "should show ceshijilu" do
    get ceshijilu_url(@ceshijilu)
    assert_response :success
  end

  test "should get edit" do
    get edit_ceshijilu_url(@ceshijilu)
    assert_response :success
  end

  test "should update ceshijilu" do
    patch ceshijilu_url(@ceshijilu), params: { ceshijilu: { beizhu: @ceshijilu.beizhu, jiaoben: @ceshijilu.jiaoben, mingcheng: @ceshijilu.mingcheng } }
    assert_redirected_to ceshijilu_url(@ceshijilu)
  end

  test "should destroy ceshijilu" do
    assert_difference('Ceshijilu.count', -1) do
      delete ceshijilu_url(@ceshijilu)
    end

    assert_redirected_to ceshijilus_url
  end
end
