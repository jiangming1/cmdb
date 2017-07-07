class CreateDiannaos < ActiveRecord::Migration[5.0]
  def change
    create_table :diannaos do |t|
      t.string :mingzi
      t.string :ip
      t.string :neiip
      t.string :yonghu
      t.string :mima
      t.string :pubkey
      t.string :miaoshu

      t.timestamps
    end
  end
end
