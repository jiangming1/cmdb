class CreateLcbzhanghus < ActiveRecord::Migration[5.0]
  def change
    create_table :lcbzhanghus do |t|
      t.string :denglumima
      t.string :dengluxingming
      t.string :shouji
      t.string :xingming
      t.string :zhifumima
      t.string :yaoqingma
      t.string :yaoqingren
      t.string :zhuangtai

      t.timestamps
    end
  end
end
