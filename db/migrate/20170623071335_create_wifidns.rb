class CreateWifidns < ActiveRecord::Migration[5.0]
  def change
    create_table :wifidns do |t|
      t.string :name
      t.string :script
      t.string :miaoshu

      t.timestamps
    end
  end
end
