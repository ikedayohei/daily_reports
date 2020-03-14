Rails.application.routes.draw do
  get 'bookmarks/create'

  get 'bookmarks/destroy'

  devise_for :users
  root "reports#index"
  resources :reports, only: [:index, :new, :create, :show, :edit, :destroy, :update]do
   resources :places, only: [:index, :new, :create, :destroy]
   resources :comments, only: [:create, :destroy]
   resource :bookmarks, only: %i[create destroy]
   get :bookmarks, on: :collection
  end
  resources :users, only: [:show, :edit, :update]
end
