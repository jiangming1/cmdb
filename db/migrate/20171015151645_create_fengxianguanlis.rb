class CreateFengxianguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :fengxianguanlis do |t|
      t.string :xingming
      t.string :shoujihao
      t.string :fenxiandengji
      t.string :shuoming

      t.timestamps
    end
  end
end
