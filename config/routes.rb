Rails.application.routes.draw do

  get 'carts' => 'public/carts#index', as: 'carts'
  post 'carts' => 'public/carts#create'
  delete 'carts/destroy_all' => 'public/carts#destroy_all'
  patch 'carts/:id' => 'public/carts#update', as: 'cart'
  delete 'carts/:id' => 'public/carts#destroy'

  get 'order' => 'public/order#new', as: 'order'
  post 'confirm' => 'public/order#confirm', as: 'confirm'
  get 'thanks' => 'public/order#thanks', as: 'thanks'
  get 'orders' => 'public/order#index', as: 'orders'
  get 'order/:id' => 'public/order#show', as: 'order_show'
  put 'order/create' => 'public/order#create', as: 'order_create'

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

  get '/dishes', to: 'public/dishes#index', as: 'dishes'
  get '/dish/:id', to: 'public/dishes#show', as: 'dish'
  get '/genre/search/:id' => 'public/searches#genre_search', as: 'genre_search'
  get '/genre/dish/search/:id' => 'public/searches#genre_dish_search', as: 'genre_dish_search'
  get '/genre/recommend' => 'public/searches#recommend_search', as: 'recommend_search'
  get '/genre/new' => 'public/searches#new_search', as: 'new_search'
  get '/genre/dish/new' => 'public/searches#new_dish_search', as: 'new_dish_search'
  post '/address' => 'public/address#create', as: 'address'



  namespace :admin do
    root to: "homes#top"
    resources :bento, :customer ,:dishes ,:genres ,:genre_dishes
    put '/recommend/:id', to: 'bento#recommend', as: 'recommend'
    get '/orders', to: 'orders#index', as: 'orders'
    get '/order/:id', to: 'orders#show', as: 'order'
    put '/order/:id', to: 'orders#update', as: 'order_update'
    put '/order/:id/orderdetail/:detail_id', to: 'order_details#update', as: 'order_detail_update'
    get '/genre/search/:id' => 'searches#genre_search', as: 'genre_search'
    get '/genre/dish/search/:id' => 'searches#genre_dish_search', as: 'genre_dish_search'
    get '/genre/dish/new' => 'searches#new_dish_search', as: 'new_dish_search'
    get '/genre/recommend' => 'searches#recommend_search', as: 'recommend_search'
    get '/genre/new' => 'searches#new_search', as: 'new_search'
    get '/customer/:id/orders' => 'customer#orders', as: 'customer_orders'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
