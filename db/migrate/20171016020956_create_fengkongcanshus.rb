class CreateFengkongcanshus < ActiveRecord::Migration[5.0]
  def change
    create_table :fengkongcanshus do |t|
      t.string :bianma
      t.string :mingcheng
      t.string :zhi1
      t.string :zhi2
      t.string :shuoming

      t.timestamps
    end
  end
end
