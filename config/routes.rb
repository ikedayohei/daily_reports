Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'bookmarks/create'

  get 'bookmarks/destroy'

  get 'maps/index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  } 
  root "reports#index"
  resources :reports do
   resources :comments, only: [:create, :destroy]
   resource :bookmarks, only: %i[create destroy]
   get :bookmarks, on: :collection
  end
  resources :companies do
   resources :likes, only: [:create, :destroy]
  end
  resources :maps,only: [:index]
  resources :users, only: [:show, :edit, :update]
  
end
