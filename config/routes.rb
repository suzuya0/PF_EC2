Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  resources :users, except: [:index, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  patch '/users/:id/delete' => 'users#delete', as: 'delete'
  get '/users/:id/confirm' => 'users#confirm', as: 'confirm'
  get '/users/:id/barters' => 'users#barter', as: 'barters'
  get '/users/:id/wants' => 'users#want', as: 'wants'
  get '/users/:id/bookmarks' => 'users#bookmark', as: 'bookmarks'
  get '/users/:id/rooms' => 'users#room', as: 'users_rooms'
  
  resources :bartered_items, except: [:destroy] do
   resource :bookmarks,only: [:create, :destroy]
   resources :bartered_item_comments, only: [:create, :destroy]
  end
  patch 'bartered_items/:id/delete' => 'bartered_items#delete', as: 'barter_delete'
  get 'search' => 'bartered_items#search'
  
  resources :wanted_items, except: [:index]
  
  resources :messages, only: [:create, :destroy]
  resources :rooms, only: [:create, :show]
  
  
  root to: 'homes#top'
  get 'about' => 'homes#about'
  
  
  
end
