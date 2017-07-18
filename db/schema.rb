# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170718093116) do

  create_table "androidupdates", force: :cascade do |t|
    t.string   "shichang"
    t.string   "fabushijian"
    t.string   "apkurl"
    t.string   "versioncode"
    t.string   "versionname"
    t.string   "summary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "anzhuoceshis", force: :cascade do |t|
    t.string   "mingcheng"
    t.string   "jiaoben"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "anzhuozidonghuaceshis", force: :cascade do |t|
    t.string   "mingcheng"
    t.string   "jiaoben"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ceshijilus", force: :cascade do |t|
    t.string   "mingcheng"
    t.string   "jiaoben"
    t.string   "beizhu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ceshirenwuguanlis", force: :cascade do |t|
    t.string   "ceshileixing"
    t.string   "ceshixiang"
    t.string   "jiaobenmingcheng"
    t.string   "chuangjianshijian"
    t.string   "zhuangtai"
    t.string   "ceshijieguo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "changyongzuoye1s", force: :cascade do |t|
    t.string   "zuoyemingcheng"
    t.string   "fenleibiaoqian"
    t.string   "quanjubianliangshezhi"
    t.string   "buzhoumingcheng"
    t.string   "jiaobenmingcheng"
    t.string   "zhixingzhanghu"
    t.string   "fuwuqishuliang"
    t.string   "jiaobencanshu"
    t.string   "wanchenghouzanting"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "changyongzuoyes", force: :cascade do |t|
    t.string   "zuoyemingchen"
    t.string   "fenleibiaoqian"
    t.string   "quanjubianliangshezhi"
    t.string   "buzhoumingchen"
    t.string   "jiaobenmingchen"
    t.string   "zhixingzhanghu"
    t.string   "fuwuqishu"
    t.string   "jiaobencanshu"
    t.string   "wanchenghouzhanting"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "dengluzhanghus", force: :cascade do |t|
    t.string   "zhanghaomingcheng"
    t.string   "zhanghaomima"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "diannaos", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "ip"
    t.string   "neiip"
    t.string   "yonghu"
    t.string   "mima"
    t.string   "pubkey"
    t.string   "miaoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diannaos_jiaobenzhixings", id: false, force: :cascade do |t|
    t.integer "diannao_id",        null: false
    t.integer "jiaobenzhixing_id", null: false
  end

  create_table "diannaos_kuaishufenfawenjians", id: false, force: :cascade do |t|
    t.integer "diannao_id",             null: false
    t.integer "kuaishufenfawenjian_id", null: false
  end

  create_table "diannaos_kuaisufenfawenjians", id: false, force: :cascade do |t|
    t.integer "diannao_id",            null: false
    t.integer "kuaisufenfawenjian_id", null: false
  end

  create_table "dingshirenwus", force: :cascade do |t|
    t.string   "dingshirenwu"
    t.string   "zuoyemingchen"
    t.string   "dingshiguize"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "dingshirenwus_jiaobenzhixings", id: false, force: :cascade do |t|
    t.integer "jiaobenzhixing_id", null: false
    t.integer "dingshirenwu_id",   null: false
  end

  create_table "dns", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "zhujijilu"
    t.string   "ip"
    t.string   "miaoshu"
    t.integer  "ttl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "esjiaobens", force: :cascade do |t|
    t.string   "jiaobenmingcheng"
    t.text     "jiaobenneirong"
    t.string   "beizhu"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "feiyongs", force: :cascade do |t|
    t.string   "mingzi"
    t.decimal  "jine"
    t.string   "miaoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuwus", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "svn"
    t.string   "port"
    t.string   "miaoshu"
    t.string   "diannao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ipdizhis", force: :cascade do |t|
    t.string   "wangduan"
    t.string   "vlan"
    t.string   "ip"
    t.string   "yanma"
    t.string   "xitongmingcheng"
    t.string   "yingyongduankou"
    t.string   "yuming"
    t.string   "beizhu"
    t.string   "quyu"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "jiankongs", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "script"
    t.string   "miaoshu"
    t.string   "fuwu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jiaobenzhixings", force: :cascade do |t|
    t.string   "jiaobenmingcheng"
    t.string   "zhixingzhanghu"
    t.string   "mubiaojiqi"
    t.string   "jiaobenneirong"
    t.string   "jiaobencanshu"
    t.string   "chaoshishijian"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "kuaisufenfawenjians", force: :cascade do |t|
    t.string   "zuoyemingchen"
    t.text     "yuanwenjian"
    t.string   "mubiaowenjian"
    t.string   "zhixingzhanghu"
    t.string   "mubiaojiqi"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "kuaisujiaobenzhixings", force: :cascade do |t|
    t.string   "jiaobenmingchen"
    t.string   "zhixingzhanghu"
    t.string   "mubiaojiqi"
    t.string   "jiaobenlaiyuan"
    t.string   "jiaobenneirong"
    t.string   "jiaobencanshu"
    t.string   "chaoshishijian"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "kuaisuzhixingsqljiaobens", force: :cascade do |t|
    t.string   "jiaobenmingchen"
    t.string   "dbzhanghaobieming"
    t.string   "mubiaojiqi"
    t.text     "jiaobenneirong"
    t.string   "chaoshishijian"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "menuindices", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "menu_id"
  end

  create_table "mimas", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "mima"
    t.string   "miaoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peizhiguanlis", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "zhujijilu"
    t.string   "ip"
    t.string   "script"
    t.string   "miaoshu"
    t.integer  "ttl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pingguoceshis", force: :cascade do |t|
    t.string   "mingcheng"
    t.text     "jiaoben"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pingguodingshirenwus", force: :cascade do |t|
    t.string   "chengxumingcheng"
    t.string   "guanjianci"
    t.string   "dijiming"
    t.string   "beizhu"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "pingguozhanghaos", force: :cascade do |t|
    t.string   "zhanghao"
    t.string   "zhanghaomima"
    t.string   "beizhu"
    t.string   "zhuangtai"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shoujis", force: :cascade do |t|
    t.string   "ip"
    t.string   "myid"
    t.string   "beizhu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shuabangs", force: :cascade do |t|
    t.string   "appmingzi"
    t.string   "guanjianci"
    t.string   "laopaiming"
    t.string   "paiming"
    t.string   "appleshuliang"
    t.string   "shuabangshijian"
    t.string   "shangshengshijian"
    t.string   "beizhu"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "shujufenxis", force: :cascade do |t|
    t.string   "chengxumingcheng"
    t.string   "wangzhi"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shujukujiaobens", force: :cascade do |t|
    t.string   "jiaobenmingcheng"
    t.string   "shujuquzhanghao"
    t.string   "mubiaojiqi"
    t.string   "buzhoumingcheng"
    t.string   "jiaobenlaiyuan"
    t.string   "jiaobenneirong"
    t.string   "caoshishijian"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shujukusqlguanlis", force: :cascade do |t|
    t.string   "jiaobenmingcheng"
    t.string   "jiaobenneirong"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shujukuzhanghus", force: :cascade do |t|
    t.string   "shujukuzhanghaobieming"
    t.string   "shujukuzhanghao"
    t.string   "shujukumima"
    t.string   "duankou"
    t.string   "leixing"
    t.string   "zhixingdexitongzhanghu"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sousuos", force: :cascade do |t|
    t.string   "appname"
    t.string   "gongsi"
    t.string   "leixing"
    t.string   "type"
    t.string   "qushi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sslzhengshus", force: :cascade do |t|
    t.string   "name"
    t.string   "script"
    t.string   "guoqiriqi"
    t.string   "miaoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "umengs", force: :cascade do |t|
    t.string   "yingyongming"
    t.string   "jinrixinzeng"
    t.string   "huoyueyonghu"
    t.string   "zuoriqidongcishu"
    t.string   "zuorileiji"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "webceshis", force: :cascade do |t|
    t.string   "mingcheng"
    t.string   "jiaoben"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wifidns", force: :cascade do |t|
    t.string   "name"
    t.string   "script"
    t.string   "miaoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xitongzhanghuguanlis", force: :cascade do |t|
    t.string   "xitongzhanghao"
    t.string   "xitongmima"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "yumings", force: :cascade do |t|
    t.string   "mingzi"
    t.string   "ip"
    t.string   "miaoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
