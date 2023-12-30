Rails.application.routes.draw do
  
  namespace :admin do
    resources :homes
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    get 'homes/top'
    get 'admin/index'
    get 'admin/show'
    get 'admin/edit'
    get 'admin/new'
    get 'bento/index'
    get 'bento/show'
    get 'bento/edit'
    get 'bento/new'
    get 'customer/index'
    get 'customer/show'
    get 'customer/edit'
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root to: "public/homes#top"
  get '/about', to: 'public/homes#about', as: 'about'
  get '/comfirm', to: 'public/homes#comfirm', as: 'comfirm'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
