class CreateDizhiguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :dizhiguanlis do |t|
      t.string :daima
      t.string :mingcheng
      t.string :shangjichengshi
      t.string :dengji
      t.string :paixu
      t.string :pinyin
      t.string :jianpin

      t.timestamps
    end
  end
end
