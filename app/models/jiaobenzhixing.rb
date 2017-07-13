class Jiaobenzhixing < ApplicationRecord
has_and_belongs_to_many :diannaos
has_and_belongs_to_many :dingshirenwus

accepts_nested_attributes_for :diannaos, allow_destroy: true
def to_s
  jiaobenmingcheng.to_s
end

end
