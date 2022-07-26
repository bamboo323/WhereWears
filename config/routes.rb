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

      resource :relationships, only: [:create, :destroy]
      #あるユーザーがフォローしている人全員を表示
      get :followings, on: :member
      #あるユーザーをフォローしている人全員を表示
      get :followers, on: :member
  end
    resources :shops do
      resources :shop_comments, only: [:create, :destroy]
      resources :genres, only: [:show]
      collection do
        get :search
      end
    end
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get "/admins" => "admins/homes#top"
  namespace :admins do

    resources :users, only: [:index, :show, :edit, :update] do
      patch "/out" => "users#out"
    end

    resources :shops, only: [:index, :show, :edit, :update, :destroy] do
      resources :shop_comments, only: [:destroy]
    end
    resources :genres, only: [:index, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
