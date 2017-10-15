class CreateDakuanshibais < ActiveRecord::Migration[5.0]
  def change
    create_table :dakuanshibais do |t|
      t.string :xingming
      t.string :shoujihao
      t.string :jiekuanjine
      t.string :jiekuanlixi
      t.string :jiekuanqixian
      t.string :jiekuanshijian
      t.string :shenheshijian
      t.string :shenheren
      t.boolean :caozuo

      t.timestamps
    end
  end
end
