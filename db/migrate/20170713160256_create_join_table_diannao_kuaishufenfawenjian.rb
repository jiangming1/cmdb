class CreateJoinTableDiannaoKuaishufenfawenjian < ActiveRecord::Migration[5.0]
  def change
    create_join_table :diannaos, :kuaishufenfawenjians do |t|
      # t.index [:diannao_id, :kuaishufenfawenjian_id]
      # t.index [:kuaishufenfawenjian_id, :diannao_id]
    end
  end
end
