class CreateYumings < ActiveRecord::Migration[5.0]
  def change
    create_table :yumings do |t|
      t.string :mingzi
      t.string :ip
      t.string :miaoshu

      t.timestamps
    end
  end
end
