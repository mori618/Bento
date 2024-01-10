Rails.application.routes.draw do

  get 'carts' => 'public/carts#index', as: 'carts'
  post 'carts' => 'public/carts#create'
  delete 'carts/destroy_all' => 'public/carts#destroy_all'
  patch 'carts/:id' => 'public/carts#update', as: 'cart'
  delete 'carts/:id' => 'public/carts#destroy'

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

  get '/mypage', to: 'public/customers#show', as: 'customer'
  get '/mypage/edit', to: 'public/customers#edit', as: 'edit_customer'
  patch '/mypage/update' => 'public/customers#update', as: 'update_customer'

  get '/bento/index', to: 'public/bento_box#index', as: 'bento_index'
  get '/bento/:id', to: 'public/bento_box#show', as: 'bento'

  get '/dishes', to: 'public/dushes#index', as: 'dishes'
  get '/dish/:id', to: 'public/dishes#show', as: 'dish'

  namespace :admin do
    root to: "homes#top"
    resources :admin, :bento, :customer ,:dishes ,:genres ,:genre_dishes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
