class CreateCaiwuhuizongs < ActiveRecord::Migration[5.0]
  def change
    create_table :caiwuhuizongs do |t|
      t.string :tongjiriqi
      t.string :tongjileixing
      t.string :jietiaozongbishu
      t.string :jietiaojine
      t.string :jietiaolixi
      t.string :fangkuanzongbishu
      t.string :fangkuanjine
      t.string :fangkuanlixi
      t.string :xujiezongbishu
      t.string :xujiejine
      t.string :xujielixi
      t.string :zongjine

      t.timestamps
    end
  end
end
