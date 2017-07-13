class CreateJoinTableDiannaoJiaobenzhixing < ActiveRecord::Migration[5.0]
  def change
    create_join_table :diannaos, :jiaobenzhixings do |t|
      # t.index [:diannao_id, :jiaobenzhixing_id]
      # t.index [:jiaobenzhixing_id, :diannao_id]
    end
  end
end
