class CreateSousuos < ActiveRecord::Migration[5.0]
  def change
    create_table :sousuos do |t|
      t.string :appname
      t.string :gongsi
      t.string :leixing
      t.string :type
      t.string :qushi

      t.timestamps
    end
  end
end
