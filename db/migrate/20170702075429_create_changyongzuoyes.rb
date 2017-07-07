class CreateChangyongzuoyes < ActiveRecord::Migration[5.0]
  def change
    create_table :changyongzuoyes do |t|
      t.string :zuoyemingchen
      t.string :fenleibiaoqian
      t.string :quanjubianliangshezhi
      t.string :buzhoumingchen
      t.string :jiaobenmingchen
      t.string :zhixingzhanghu
      t.string :fuwuqishu
      t.string :jiaobencanshu
      t.string :wanchenghouzhanting

      t.timestamps
    end
  end
end
