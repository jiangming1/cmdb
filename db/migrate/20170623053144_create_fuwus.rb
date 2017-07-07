class CreateFuwus < ActiveRecord::Migration[5.0]
  def change
    create_table :fuwus do |t|
      t.string :mingzi
      t.string :svn
      t.string :port
      t.string :miaoshu
      t.string :diannao_id

      t.timestamps
    end
  end
end
