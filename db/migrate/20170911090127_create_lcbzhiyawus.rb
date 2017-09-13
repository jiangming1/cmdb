class CreateLcbzhiyawus < ActiveRecord::Migration[5.0]
  def change
    create_table :lcbzhiyawus do |t|
      t.string :zhuangtai
      t.decimal :mubiaojine
      t.decimal :mujijine
      t.decimal :lilv
      t.integer :cunkuanqixian
      t.string :mingcheng
      t.string :zuixiaoine

      t.timestamps
    end
  end
end
