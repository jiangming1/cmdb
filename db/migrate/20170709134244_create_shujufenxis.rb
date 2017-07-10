class CreateShujufenxis < ActiveRecord::Migration[5.0]
  def change
    create_table :shujufenxis do |t|
      t.string :chengxumingcheng
      t.string :wangzhi

      t.timestamps
    end
  end
end
