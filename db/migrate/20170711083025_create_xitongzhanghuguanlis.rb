class CreateXitongzhanghuguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :xitongzhanghuguanlis do |t|
      t.string :xitongzhanghao
      t.string :xitongmima

      t.timestamps
    end
  end
end
