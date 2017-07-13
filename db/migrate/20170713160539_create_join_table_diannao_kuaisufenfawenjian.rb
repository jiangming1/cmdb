class CreateJoinTableDiannaoKuaisufenfawenjian < ActiveRecord::Migration[5.0]
  def change
    create_join_table :diannaos, :kuaisufenfawenjians do |t|
      # t.index [:diannao_id, :kuaisufenfawenjian_id]
      # t.index [:kuaisufenfawenjian_id, :diannao_id]
    end
  end
end
