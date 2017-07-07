class CreateJiankongs < ActiveRecord::Migration[5.0]
  def change
    create_table :jiankongs do |t|
      t.string :mingzi
      t.string :script
      t.string :miaoshu
      t.string :fuwu_id

      t.timestamps
    end
  end
end
