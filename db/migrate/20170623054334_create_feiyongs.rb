class CreateFeiyongs < ActiveRecord::Migration[5.0]
  def change
    create_table :feiyongs do |t|
      t.string :mingzi
      t.decimal :jine
      t.string :miaoshu

      t.timestamps
    end
  end
end
