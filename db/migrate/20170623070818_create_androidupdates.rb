class CreateAndroidupdates < ActiveRecord::Migration[5.0]
  def change
    create_table :androidupdates do |t|
      t.string :shichang
      t.string :fabushijian
      t.string :apkurl
      t.string :versioncode
      t.string :versionname
      t.string :summary

      t.timestamps
    end
  end
end
