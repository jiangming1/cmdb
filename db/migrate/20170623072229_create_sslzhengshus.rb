class CreateSslzhengshus < ActiveRecord::Migration[5.0]
  def change
    create_table :sslzhengshus do |t|
      t.string :name
      t.string :script
      t.string :guoqiriqi
      t.string :miaoshu

      t.timestamps
    end
  end
end
