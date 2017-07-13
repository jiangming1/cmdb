class CreateJoinTableDiannaoDingshirenwu < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jiaobenzhixings, :dingshirenwus do |t|
      # t.index [:jiaobenzhixing_id, :dingshirenwu_id]
      # t.index [:dingshirenwu_id, :jiaobenzhixing_id]
    end
  end
end
