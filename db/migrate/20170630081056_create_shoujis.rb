class CreateShoujis < ActiveRecord::Migration[5.0]
  def change
    create_table :shoujis do |t|
      t.string :ip
      t.string :myid
      t.string :beizhu

      t.timestamps
    end
  end
end
