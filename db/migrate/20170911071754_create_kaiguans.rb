class CreateKaiguans < ActiveRecord::Migration[5.0]
  def change
    create_table :kaiguans do |t|
      t.string :xingming
      t.boolean :kaiqi

      t.timestamps
    end
  end
end
