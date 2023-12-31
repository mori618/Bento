Rails.application.routes.draw do



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

  namespace :admin do
    root to: "homes#top"
    resources :admin, :bento, :customer ,:dishes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
