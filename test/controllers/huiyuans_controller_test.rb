require 'test_helper'

class HuiyuansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @huiyuan = huiyuans(:one)
  end

  test "should get index" do
    get huiyuans_url
    assert_response :success
  end

  test "should get new" do
    get new_huiyuan_url
    assert_response :success
  end

  test "should create huiyuan" do
    assert_difference('Huiyuan.count') do
      post huiyuans_url, params: { huiyuan: { email: @huiyuan.email, fengxiandengji: @huiyuan.fengxiandengji, gongsichengshi: @huiyuan.gongsichengshi, gongsidianhua: @huiyuan.gongsidianhua, gongsidizhi: @huiyuan.gongsidizhi, gongsimingcheng: @huiyuan.gongsimingcheng, guanxi: @huiyuan.guanxi, guanxidianhua: @huiyuan.guanxidianhua, hunyinzhuangkuang: @huiyuan.hunyinzhuangkuang, jiaoyuqingkuang: @huiyuan.jiaoyuqingkuang, jiekuancishu: @huiyuan.jiekuancishu, juzhushichang: @huiyuan.juzhushichang, laiyuan: @huiyuan.laiyuan, qingshudianhua: @huiyuan.qingshudianhua, qinshu: @huiyuan.qinshu, qq: @huiyuan.qq, shenfenzheng: @huiyuan.shenfenzheng, shenfenzheng: @huiyuan.shenfenzheng, shenheren: @huiyuan.shenheren, shoujihao: @huiyuan.shoujihao, shouru: @huiyuan.shouru, suozaichengshi: @huiyuan.suozaichengshi, tuijianren: @huiyuan.tuijianren, xingming: @huiyuan.xingming, xinxitianxieqingkuang: @huiyuan.xinxitianxieqingkuang, xinyongedu: @huiyuan.xinyongedu, yinhanghuming: @huiyuan.yinhanghuming, yinhangkahao: @huiyuan.yinhangkahao, yinhangkaxinxitianxieqingkuang: @huiyuan.yinhangkaxinxitianxieqingkuang, yinhangmingcheng: @huiyuan.yinhangmingcheng, yinhangyuliushenfengzhenghaoma: @huiyuan.yinhangyuliushenfengzhenghaoma, yinhangyuliushoujihao: @huiyuan.yinhangyuliushoujihao, yonghuzhuangtai: @huiyuan.yonghuzhuangtai, yunyingshang: @huiyuan.yunyingshang, zhaopian: @huiyuan.zhaopian, zhiye: @huiyuan.zhiye, zuijinjiekuanzhuangtai: @huiyuan.zuijinjiekuanzhuangtai, zuzhudizhi: @huiyuan.zuzhudizhi } }
    end

    assert_redirected_to huiyuan_url(Huiyuan.last)
  end

  test "should show huiyuan" do
    get huiyuan_url(@huiyuan)
    assert_response :success
  end

  test "should get edit" do
    get edit_huiyuan_url(@huiyuan)
    assert_response :success
  end

  test "should update huiyuan" do
    patch huiyuan_url(@huiyuan), params: { huiyuan: { email: @huiyuan.email, fengxiandengji: @huiyuan.fengxiandengji, gongsichengshi: @huiyuan.gongsichengshi, gongsidianhua: @huiyuan.gongsidianhua, gongsidizhi: @huiyuan.gongsidizhi, gongsimingcheng: @huiyuan.gongsimingcheng, guanxi: @huiyuan.guanxi, guanxidianhua: @huiyuan.guanxidianhua, hunyinzhuangkuang: @huiyuan.hunyinzhuangkuang, jiaoyuqingkuang: @huiyuan.jiaoyuqingkuang, jiekuancishu: @huiyuan.jiekuancishu, juzhushichang: @huiyuan.juzhushichang, laiyuan: @huiyuan.laiyuan, qingshudianhua: @huiyuan.qingshudianhua, qinshu: @huiyuan.qinshu, qq: @huiyuan.qq, shenfenzheng: @huiyuan.shenfenzheng, shenfenzheng: @huiyuan.shenfenzheng, shenheren: @huiyuan.shenheren, shoujihao: @huiyuan.shoujihao, shouru: @huiyuan.shouru, suozaichengshi: @huiyuan.suozaichengshi, tuijianren: @huiyuan.tuijianren, xingming: @huiyuan.xingming, xinxitianxieqingkuang: @huiyuan.xinxitianxieqingkuang, xinyongedu: @huiyuan.xinyongedu, yinhanghuming: @huiyuan.yinhanghuming, yinhangkahao: @huiyuan.yinhangkahao, yinhangkaxinxitianxieqingkuang: @huiyuan.yinhangkaxinxitianxieqingkuang, yinhangmingcheng: @huiyuan.yinhangmingcheng, yinhangyuliushenfengzhenghaoma: @huiyuan.yinhangyuliushenfengzhenghaoma, yinhangyuliushoujihao: @huiyuan.yinhangyuliushoujihao, yonghuzhuangtai: @huiyuan.yonghuzhuangtai, yunyingshang: @huiyuan.yunyingshang, zhaopian: @huiyuan.zhaopian, zhiye: @huiyuan.zhiye, zuijinjiekuanzhuangtai: @huiyuan.zuijinjiekuanzhuangtai, zuzhudizhi: @huiyuan.zuzhudizhi } }
    assert_redirected_to huiyuan_url(@huiyuan)
  end

  test "should destroy huiyuan" do
    assert_difference('Huiyuan.count', -1) do
      delete huiyuan_url(@huiyuan)
    end

    assert_redirected_to huiyuans_url
  end
end
