class CreateJiaoseguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :jiaoseguanlis do |t|
      t.string :jiaosedaima
      t.string :jiaosemingcheng
      t.string :suoshuquanxian
      t.boolean :qiyong

      t.timestamps
    end
  end
end
