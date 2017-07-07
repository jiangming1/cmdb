class CreateUmengs < ActiveRecord::Migration[5.0]
  def change
    create_table :umengs do |t|
      t.string :yingyongming
      t.string :jinrixinzeng
      t.string :huoyueyonghu
      t.string :zuoriqidongcishu
      t.string :zuorileiji

      t.timestamps
    end
  end
end
