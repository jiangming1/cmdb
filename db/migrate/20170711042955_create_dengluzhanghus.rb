class CreateDengluzhanghus < ActiveRecord::Migration[5.0]
  def change
    create_table :dengluzhanghus do |t|
      t.string :zhanghaomingcheng
      t.string :zhanghaomima

      t.timestamps
    end
  end
end
