class CreateXiaoxiliebiaos < ActiveRecord::Migration[5.0]
  def change
    create_table :xiaoxiliebiaos do |t|
      t.string :yonghuxingming
      t.string :shoujihao
      t.string :xiaoxileixing
      t.string :chuangjianshijian
      t.string :biaoti
      t.string :neirong
      t.string :caozuo

      t.timestamps
    end
  end
end
