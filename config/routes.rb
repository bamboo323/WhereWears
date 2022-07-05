Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "publics/homes#top"
  get "/about" => "publics/homes#about"

  namespace :publics do
    resources :users, onle: [:index, :show, :edit, :update]

    get "/customers/exit" => "customers#exit"
    patch "/customers/out" => "customers#out"

    resources :shops


  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
