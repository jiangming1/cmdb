class CreatePingguoceshis < ActiveRecord::Migration[5.0]
  def change
    create_table :pingguoceshis do |t|
      t.string :mingcheng
      t.text :jiaoben

      t.timestamps
    end
  end
end
