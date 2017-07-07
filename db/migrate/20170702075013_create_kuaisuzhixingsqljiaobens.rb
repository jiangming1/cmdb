class CreateKuaisuzhixingsqljiaobens < ActiveRecord::Migration[5.0]
  def change
    create_table :kuaisuzhixingsqljiaobens do |t|
      t.string :jiaobenmingchen
      t.string :dbzhanghaobieming
      t.string :mubiaojiqi
      t.text :jiaobenneirong
      t.string :chaoshishijian

      t.timestamps
    end
  end
end
