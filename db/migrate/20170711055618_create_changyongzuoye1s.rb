class CreateChangyongzuoye1s < ActiveRecord::Migration[5.0]
  def change
    create_table :changyongzuoye1s do |t|
      t.string :zuoyemingcheng
      t.string :fenleibiaoqian
      t.string :quanjubianliangshezhi
      t.string :buzhoumingcheng
      t.string :jiaobenmingcheng
      t.string :zhixingzhanghu
      t.string :fuwuqishuliang
      t.string :jiaobencanshu
      t.string :wanchenghouzanting

      t.timestamps
    end
  end
end
