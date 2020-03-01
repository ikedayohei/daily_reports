Rails.application.routes.draw do
  devise_for :users
  root "reports#index"
  resources :reports, only: [:index, :new, :create, :show, :edit, :destroy, :update]
  resources :users, only: [:edit, :update]

end
