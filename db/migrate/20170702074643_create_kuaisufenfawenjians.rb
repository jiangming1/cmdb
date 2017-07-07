class CreateKuaisufenfawenjians < ActiveRecord::Migration[5.0]
  def change
    create_table :kuaisufenfawenjians do |t|
      t.string :zuoyemingchen
      t.text :yuanwenjian
      t.string :mubiaowenjian
      t.string :zhixingzhanghu
      t.string :mubiaojiqi

      t.timestamps
    end
  end
end
