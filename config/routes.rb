Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
