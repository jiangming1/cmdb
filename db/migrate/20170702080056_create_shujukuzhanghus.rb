class CreateShujukuzhanghus < ActiveRecord::Migration[5.0]
  def change
    create_table :shujukuzhanghus do |t|
      t.string :shujukuzhanghaobieming
      t.string :shujukuzhanghao
      t.string :shujukumima
      t.string :duankou
      t.string :leixing
      t.string :zhixingdexitongzhanghu

      t.timestamps
    end
  end
end
