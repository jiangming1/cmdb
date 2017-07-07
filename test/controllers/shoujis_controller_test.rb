require 'test_helper'

class ShoujisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shouji = shoujis(:one)
  end

  test "should get index" do
    get shoujis_url
    assert_response :success
  end

  test "should get new" do
    get new_shouji_url
    assert_response :success
  end

  test "should create shouji" do
    assert_difference('Shouji.count') do
      post shoujis_url, params: { shouji: { beizhu: @shouji.beizhu, ip: @shouji.ip, myid: @shouji.myid } }
    end

    assert_redirected_to shouji_url(Shouji.last)
  end

  test "should show shouji" do
    get shouji_url(@shouji)
    assert_response :success
  end

  test "should get edit" do
    get edit_shouji_url(@shouji)
    assert_response :success
  end

  test "should update shouji" do
    patch shouji_url(@shouji), params: { shouji: { beizhu: @shouji.beizhu, ip: @shouji.ip, myid: @shouji.myid } }
    assert_redirected_to shouji_url(@shouji)
  end

  test "should destroy shouji" do
    assert_difference('Shouji.count', -1) do
      delete shouji_url(@shouji)
    end

    assert_redirected_to shoujis_url
  end
end
