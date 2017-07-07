class CreateKuaisujiaobenzhixings < ActiveRecord::Migration[5.0]
  def change
    create_table :kuaisujiaobenzhixings do |t|
      t.string :jiaobenmingchen
      t.string :zhixingzhanghu
      t.string :mubiaojiqi
      t.string :jiaobenlaiyuan
      t.string :jiaobenneirong
      t.string :jiaobencanshu
      t.string :chaoshishijian

      t.timestamps
    end
  end
end
