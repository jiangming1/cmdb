class Diannao < ApplicationRecord
has_and_belongs_to_many :Jiaobenzhixings

accepts_nested_attributes_for :Jiaobenzhixings, allow_destroy: true
def to_s
  mingzi.to_s+"_"+ip.to_s
end
end
