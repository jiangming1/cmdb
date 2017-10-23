class CreateTuiguangxiangqings < ActiveRecord::Migration[5.0]
  def change
    create_table :tuiguangxiangqings do |t|
      t.string :tuiguangmingcheng
      t.string :zhuceshu
      t.string :shenqingshu
      t.string :fangkuanshu
      t.string :fangkuanjine
      t.string :tongjiriqi
      t.string :zuihoushuaxinshijian

      t.timestamps
    end
  end
end
