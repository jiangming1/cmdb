class CreateDianhuahuangyes < ActiveRecord::Migration[5.0]
  def change
    create_table :dianhuahuangyes do |t|
      t.string :dianhuahaoma
      t.string :mingcheng
      t.string :guanzhuchengdu
      t.string :shuoming

      t.timestamps
    end
  end
end
