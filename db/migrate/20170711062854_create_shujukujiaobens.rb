class CreateShujukujiaobens < ActiveRecord::Migration[5.0]
  def change
    create_table :shujukujiaobens do |t|
      t.string :jiaobenmingcheng
      t.string :shujuquzhanghao
      t.string :mubiaojiqi
      t.string :buzhoumingcheng
      t.string :jiaobenlaiyuan
      t.string :jiaobenneirong
      t.string :caoshishijian

      t.timestamps
    end
  end
end
