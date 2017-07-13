class Jiaobenzhixing < ApplicationRecord
has_and_belongs_to_many :diannaos
accepts_nested_attributes_for :diannaos, allow_destroy: true
end
