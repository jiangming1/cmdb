class CreatePingguodingshirenwus < ActiveRecord::Migration[5.0]
  def change
    create_table :pingguodingshirenwus do |t|
      t.string :chengxumingcheng
      t.string :guanjianci
      t.string :dijiming
      t.string :beizhu

      t.timestamps
    end
  end
end
