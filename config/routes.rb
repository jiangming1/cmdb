Rails.application.routes.draw do
  resources :caiwuhuizongs
  resources :jichucanshus
  resources :fengkongcanshus
  resources :tuiguangxiangqings
  resources :xiaoxiliebiaos
  resources :xiaoximobans
  resources :dizhiguanlis
  resources :jiaoseguanlis
  resources :quanxianguanlis
  resources :guanliyuans
  resources :dakuanshibais
  resources :yifangkuans
  resources :xujiedaifangkuanliebiaos
  resources :xinyonghudaifangkuanliebiaos
  resources :tuiguangs
  resources :dianhuahuangyes
  resources :fengxianguanlis
  resources :huiyuans
  resources :lcbzhiyawus
  resources :lcbzhanghus
  resources :kaiguans
  resources :lvmaotongs
  resources :webceshis
  resources :ceshijilus
  resources :pingguoceshis
  resources :anzhuoceshis
  resources :anzhuozidonghuaceshis
  resources :jiaobenzhixings
  resources :esjiaobens
  resources :xitongzhanghuguanlis
  resources :shujukusqlguanlis
  resources :shujukujiaobens
  resources :changyongzuoye1s
  resources :dengluzhanghus
  resources :shujufenxis
  resources :ceshirenwuguanlis
  resources :pingguodingshirenwus
  resources :shujukuzhanghus
  resources :dingshirenwus
  resources :changyongzuoyes
  resources :kuaisuzhixingsqljiaobens
  resources :kuaisufenfawenjians
  resources :kuaisujiaobenzhixings
  resources :pingguozhanghaos
  resources :ipdizhis
  resources :sousuos
  resources :umengs
  resources :shoujis
  resources :shuabangs
  resources :sslzhengshus
  resources :wifidns
  resources :androidupdates
  resources :menus
  resources :menuindices
  resources :peizhiguanlis
  resources :dns
  resources :yumings
  resources :jiankongs
  resources :feiyongs
  resources :mimas
  resources :fuwus
  resources :apps
  resources :diannaos
  get "/" => redirect("/menus")
  post 'login', :to => 'dengluzhanghus#login'
  get 'upload', :to => 'upload#index'
  post 'upload', :to => 'upload#upload'
  #get '/login' => 'dengluzhanghus#login1', :as => "menus"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
