class CreateDingshirenwus < ActiveRecord::Migration[5.0]
  def change
    create_table :dingshirenwus do |t|
      t.string :dingshirenwu
      t.string :zuoyemingchen
      t.string :dingshiguize

      t.timestamps
    end
  end
end
