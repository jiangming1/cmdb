class CreateLvmaotongs < ActiveRecord::Migration[5.0]
  def change
    create_table :lvmaotongs do |t|
      t.string :xingming
      t.string :dianhua
      t.timestamps
    end
  end
end
