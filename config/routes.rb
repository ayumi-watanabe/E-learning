Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :sessions, only:[:new, :create, :destroy]

  resources :relationships, only: [:create, :destroy]
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end



end
