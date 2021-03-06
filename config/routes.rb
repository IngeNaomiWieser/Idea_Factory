Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "ideas#index"

  resources :users, only: [:new, :create]

  resources :ideas do
    resources :reviews, only: [:create, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    get :destroy, on: :collection
  end



end
