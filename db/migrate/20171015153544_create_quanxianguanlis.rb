class CreateQuanxianguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :quanxianguanlis do |t|
      t.string :quanxianmingcheng
      t.string :dizhi
      t.string :suoshucaidan
      t.boolean :qiyong

      t.timestamps
    end
  end
end
