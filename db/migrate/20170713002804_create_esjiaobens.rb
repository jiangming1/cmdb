class CreateEsjiaobens < ActiveRecord::Migration[5.0]
  def change
    create_table :esjiaobens do |t|
      t.string :jiaobenmingcheng
      t.text :jiaobenneirong
      t.string :beizhu

      t.timestamps
    end
  end
end
