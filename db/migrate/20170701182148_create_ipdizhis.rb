class CreateIpdizhis < ActiveRecord::Migration[5.0]
  def change
    create_table :ipdizhis do |t|
      t.string :wangduan
      t.string :vlan
      t.string :ip
      t.string :yanma
      t.string :xitongmingcheng
      t.string :yingyongduankou
      t.string :yuming
      t.string :beizhu
      t.string :quyu

      t.timestamps
    end
  end
end
