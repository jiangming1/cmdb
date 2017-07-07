class CreatePingguozhanghaos < ActiveRecord::Migration[5.0]
  def change
    create_table :pingguozhanghaos do |t|
      t.string :zhanghao
      t.string :zhanghaomima
      t.string :beizhu
      t.string :zhuangtai

      t.timestamps
    end
  end
end
