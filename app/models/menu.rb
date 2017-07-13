class Menu < ApplicationRecord
  has_many :submenu, class_name: "menu",
                          foreign_key: "menu_id"
 
#  belongs_to :pmenu, class_name: "menu"
end
