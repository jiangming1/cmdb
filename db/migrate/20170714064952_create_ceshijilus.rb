class CreateCeshijilus < ActiveRecord::Migration[5.0]
  def change
    create_table :ceshijilus do |t|
      t.string :mingcheng
      t.string :jiaoben
      t.string :beizhu

      t.timestamps
    end
  end
end
