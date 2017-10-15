class CreateGuanliyuans < ActiveRecord::Migration[5.0]
  def change
    create_table :guanliyuans do |t|
      t.string :zhanghao
      t.string :xingming
      t.date :chuangjianshijian
      t.string :dengji
      t.string :suoshujiaose
      t.string :suoshujigou
      t.string :xingbie
      t.string :shouji
      t.boolean :qiyong

      t.timestamps
    end
  end
end
