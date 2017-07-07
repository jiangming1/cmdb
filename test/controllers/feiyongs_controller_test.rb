require 'test_helper'

class FeiyongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feiyong = feiyongs(:one)
  end

  test "should get index" do
    get feiyongs_url
    assert_response :success
  end

  test "should get new" do
    get new_feiyong_url
    assert_response :success
  end

  test "should create feiyong" do
    assert_difference('Feiyong.count') do
      post feiyongs_url, params: { feiyong: { jine: @feiyong.jine, miaoshu: @feiyong.miaoshu, mingzi: @feiyong.mingzi } }
    end

    assert_redirected_to feiyong_url(Feiyong.last)
  end

  test "should show feiyong" do
    get feiyong_url(@feiyong)
    assert_response :success
  end

  test "should get edit" do
    get edit_feiyong_url(@feiyong)
    assert_response :success
  end

  test "should update feiyong" do
    patch feiyong_url(@feiyong), params: { feiyong: { jine: @feiyong.jine, miaoshu: @feiyong.miaoshu, mingzi: @feiyong.mingzi } }
    assert_redirected_to feiyong_url(@feiyong)
  end

  test "should destroy feiyong" do
    assert_difference('Feiyong.count', -1) do
      delete feiyong_url(@feiyong)
    end

    assert_redirected_to feiyongs_url
  end
end
