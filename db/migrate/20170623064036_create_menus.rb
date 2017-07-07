class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :mingzi
      t.string :url

      t.timestamps
    end
  end
end
