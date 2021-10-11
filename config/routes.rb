Rails.application.routes.draw do
  devise_for :users
  
  resources :users, except: [:index, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :bartered_items, except: [:destroy] do
   resource :bookmarks,only: [:create, :destroy]
   resources :bartered_item_comments, only: [:create, :destroy]
  end
  patch 'bartered_items/:id/delete' => 'bartered_items#delete', as: 'barter_delete'
  get 'search' => 'bartered_items#search'
  
  resources :wanted_items, except: [:index]
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  
  
  root to: 'homes#top'
  get 'about' => 'homes#about'
  
  
  
end
