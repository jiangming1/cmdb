class CreateShuabangs < ActiveRecord::Migration[5.0]
  def change
    create_table :shuabangs do |t|
      t.string :appmingzi
      t.string :guanjianci
      t.string :laopaiming
      t.string :paiming
      t.string :appleshuliang
      t.string :shuabangshijian
      t.string :shangshengshijian
      t.string :beizhu

      t.timestamps
    end
  end
end
