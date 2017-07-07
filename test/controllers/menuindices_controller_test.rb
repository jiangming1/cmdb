require 'test_helper'

class MenuindicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menuindex = menuindices(:one)
  end

  test "should get index" do
    get menuindices_url
    assert_response :success
  end

  test "should get new" do
    get new_menuindex_url
    assert_response :success
  end

  test "should create menuindex" do
    assert_difference('Menuindex.count') do
      post menuindices_url, params: { menuindex: { mingzi: @menuindex.mingzi, url: @menuindex.url } }
    end

    assert_redirected_to menuindex_url(Menuindex.last)
  end

  test "should show menuindex" do
    get menuindex_url(@menuindex)
    assert_response :success
  end

  test "should get edit" do
    get edit_menuindex_url(@menuindex)
    assert_response :success
  end

  test "should update menuindex" do
    patch menuindex_url(@menuindex), params: { menuindex: { mingzi: @menuindex.mingzi, url: @menuindex.url } }
    assert_redirected_to menuindex_url(@menuindex)
  end

  test "should destroy menuindex" do
    assert_difference('Menuindex.count', -1) do
      delete menuindex_url(@menuindex)
    end

    assert_redirected_to menuindices_url
  end
end
