Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :projects do
    resources :tickets, only: [:index, :new, :create]
  end

  resources :tickets, only: [:show, :edit, :update, :destroy] do
    resources :messages, only: [:index, :show, :new, :create]
  end

  resources :messages, only: [:show, :edit, :update, :destroy]
end
