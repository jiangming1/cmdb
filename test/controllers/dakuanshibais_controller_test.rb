require 'test_helper'

class DakuanshibaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dakuanshibai = dakuanshibais(:one)
  end

  test "should get index" do
    get dakuanshibais_url
    assert_response :success
  end

  test "should get new" do
    get new_dakuanshibai_url
    assert_response :success
  end

  test "should create dakuanshibai" do
    assert_difference('Dakuanshibai.count') do
      post dakuanshibais_url, params: { dakuanshibai: { caozuo: @dakuanshibai.caozuo, jiekuanjine: @dakuanshibai.jiekuanjine, jiekuanlixi: @dakuanshibai.jiekuanlixi, jiekuanqixian: @dakuanshibai.jiekuanqixian, jiekuanshijian: @dakuanshibai.jiekuanshijian, shenheren: @dakuanshibai.shenheren, shenheshijian: @dakuanshibai.shenheshijian, shoujihao: @dakuanshibai.shoujihao, xingming: @dakuanshibai.xingming } }
    end

    assert_redirected_to dakuanshibai_url(Dakuanshibai.last)
  end

  test "should show dakuanshibai" do
    get dakuanshibai_url(@dakuanshibai)
    assert_response :success
  end

  test "should get edit" do
    get edit_dakuanshibai_url(@dakuanshibai)
    assert_response :success
  end

  test "should update dakuanshibai" do
    patch dakuanshibai_url(@dakuanshibai), params: { dakuanshibai: { caozuo: @dakuanshibai.caozuo, jiekuanjine: @dakuanshibai.jiekuanjine, jiekuanlixi: @dakuanshibai.jiekuanlixi, jiekuanqixian: @dakuanshibai.jiekuanqixian, jiekuanshijian: @dakuanshibai.jiekuanshijian, shenheren: @dakuanshibai.shenheren, shenheshijian: @dakuanshibai.shenheshijian, shoujihao: @dakuanshibai.shoujihao, xingming: @dakuanshibai.xingming } }
    assert_redirected_to dakuanshibai_url(@dakuanshibai)
  end

  test "should destroy dakuanshibai" do
    assert_difference('Dakuanshibai.count', -1) do
      delete dakuanshibai_url(@dakuanshibai)
    end

    assert_redirected_to dakuanshibais_url
  end
end
