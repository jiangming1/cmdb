class CreateXinyonghudaifangkuanliebiaos < ActiveRecord::Migration[5.0]
  def change
    create_table :xinyonghudaifangkuanliebiaos do |t|
      t.string :xingming
      t.string :shoujihao
      t.string :jiekuanjine
      t.string :jiekuanlixi
      t.string :jiekuanqixian
      t.string :jiekuanshijian
      t.string :shenheren

      t.timestamps
    end
  end
end
