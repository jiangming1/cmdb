class CreateMenuindices < ActiveRecord::Migration[5.0]
  def change
    create_table :menuindices do |t|
      t.string :mingzi
      t.string :url

      t.timestamps
    end
  end
end
