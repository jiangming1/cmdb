class CreateHuiyuans < ActiveRecord::Migration[5.0]
  def change
    create_table :huiyuans do |t|
      t.string :xingming
      t.string :shenfenzheng
      t.string :yunyingshang
      t.string :zhaopian
      t.string :fengxiandengji
      t.string :jiekuancishu
      t.string :tuijianren
      t.string :qq
      t.string :shenfenzheng
      t.string :jiaoyuqingkuang
      t.string :juzhushichang
      t.string :zhiye
      t.string :gongsimingcheng
      t.string :gongsidizhi
      t.string :qinshu
      t.string :guanxi
      t.string :yinhangkahao
      t.string :yinhangmingcheng
      t.string :yinhangyuliushoujihao
      t.string :xinxitianxieqingkuang
      t.string :yinhangkaxinxitianxieqingkuang
      t.string :yonghuzhuangtai
      t.string :zuijinjiekuanzhuangtai
      t.string :xinyongedu
      t.string :laiyuan
      t.string :shenheren
      t.string :shoujihao
      t.string :email
      t.string :hunyinzhuangkuang
      t.string :zuzhudizhi
      t.string :shouru
      t.string :gongsichengshi
      t.string :gongsidianhua
      t.string :qingshudianhua
      t.string :guanxidianhua
      t.string :yinhanghuming
      t.string :suozaichengshi
      t.string :yinhangyuliushenfengzhenghaoma

      t.timestamps
    end
  end
end
