class CreateYifangkuans < ActiveRecord::Migration[5.0]
  def change
    create_table :yifangkuans do |t|
      t.string :xingming
      t.string :shoujihao
      t.string :jiekuanjine
      t.string :jiekuanlixi
      t.string :jiekuanqixian
      t.string :jiekuanshijian
      t.string :fangkuanshijian
      t.boolean :cehui

      t.timestamps
    end
  end
end
