class CreatePeizhiguanlis < ActiveRecord::Migration[5.0]
  def change
    create_table :peizhiguanlis do |t|
      t.string :mingzi
      t.string :zhujijilu
      t.string :ip
      t.string :script
      t.string :miaoshu
      t.integer :ttl

      t.timestamps
    end
  end
end
