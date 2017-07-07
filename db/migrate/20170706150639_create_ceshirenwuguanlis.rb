class CreateCeshirenwuguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :ceshirenwuguanlis do |t|
      t.string :ceshileixing
      t.string :ceshixiang
      t.string :jiaobenmingcheng
      t.string :chuangjianshijian
      t.string :zhuangtai
      t.string :ceshijieguo

      t.timestamps
    end
  end
end
