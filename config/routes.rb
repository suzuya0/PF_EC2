Rails.application.routes.draw do
  devise_for :users
  
  resources :bartered_items, except: [:destroy] do
   resource :bookmarks,only:[:create, :destroy]
   resources :bartered_item_comments, only: [:create, :destroy]
  end
  
  get 'search' => 'bartered_items#search'
  get 'about' => 'homes#about' 
  root to: 'homes#top'
  patch 'bartered_items/:id/delete' => 'bartered_items#delete', as: 'barter_delete'
  
end
