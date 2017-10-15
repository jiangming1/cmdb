class CreateTuiguangs < ActiveRecord::Migration[5.0]
  def change
    create_table :tuiguangs do |t|
      t.string :tuiguangfangmingcheng
      t.string :dangezhucejianglijin
      t.string :dangeziliaowanshanjianglijin
      t.string :dangefangkuanjianglijinjine
      t.string :dangefangkuangjianglijinbaifenbi
      t.boolean :dangqianzhuangtai

      t.timestamps
    end
  end
end
