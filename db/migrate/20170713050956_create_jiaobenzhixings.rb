class CreateJiaobenzhixings < ActiveRecord::Migration[5.0]
  def change
    create_table :jiaobenzhixings do |t|
      t.string :jiaobenmingcheng
      t.string :zhixingzhanghu
      t.string :mubiaojiqi
      t.string :jiaobenneirong
      t.string :jiaobencanshu
      t.string :chaoshishijian

      t.timestamps
    end
  end
end
