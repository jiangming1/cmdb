class CreateMimas < ActiveRecord::Migration[5.0]
  def change
    create_table :mimas do |t|
      t.string :mingzi
      t.string :mima
      t.string :miaoshu

      t.timestamps
    end
  end
end
