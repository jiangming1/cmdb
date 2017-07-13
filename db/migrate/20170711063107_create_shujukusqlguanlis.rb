class CreateShujukusqlguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :shujukusqlguanlis do |t|
      t.string :jiaobenmingcheng
      t.string :jiaobenneirong

      t.timestamps
    end
  end
end
