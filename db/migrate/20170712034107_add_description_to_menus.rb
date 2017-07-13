class AddDescriptionToMenus < ActiveRecord::Migration[5.0]
  def change
  add_column :menus, :menu_id , :integer, :references => "menus"

  end
end
