Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #ゲストログイン
  devise_scope :user do
    post "users/guest_sign_in" => "public/sessions#guest_sign_in"
  end


  root to: "publics/homes#top"
  get "/about" => "publics/homes#about"

  namespace :publics do
    resources :users, only: [:index, :show, :edit, :update] do
      #get "/users/:id" => "users#mypage"とするとshowとパスがかぶるため、上手く動かないので、collectionで囲う。
      collection do
       get :mypage
      end
    end
    #もしかしたら上の中に入れれるかも
    get "/users/exit" => "users#exit"
    patch "/users/out" => "users#out"

    resources :shops do
      resources :shop_comments, only: [:create, :destroy]
    end


  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get "/admins" => "admins/homes#top"
  namespace :admins do

    resources :users, only: [:index, :show, :edit, :update]
    resources :shops, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
