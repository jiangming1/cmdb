class CreateJichucanshus < ActiveRecord::Migration[5.0]
  def change
    create_table :jichucanshus do |t|
      t.string :leixingdaima
      t.string :leixingmingcheng
      t.string :daimazhi1
      t.string :daimazhi2

      t.timestamps
    end
  end
end
