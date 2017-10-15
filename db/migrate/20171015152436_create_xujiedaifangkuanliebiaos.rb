class CreateXujiedaifangkuanliebiaos < ActiveRecord::Migration[5.0]
  def change
    create_table :xujiedaifangkuanliebiaos do |t|
      t.string :xingming
      t.string :shoujihao
      t.string :jiekuanjine
      t.string :jiekuanlixi
      t.string :jiekuanqixian
      t.string :jiekuanshijian
      t.string :xujie
      t.string :shenheshijian
      t.string :shenheren
      t.boolean :tongguo

      t.timestamps
    end
  end
end
