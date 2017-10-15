class CreateXiaoximobans < ActiveRecord::Migration[5.0]
  def change
    create_table :xiaoximobans do |t|
      t.string :bianma
      t.string :biaoti
      t.string :xiaoxineirong

      t.timestamps
    end
  end
end
