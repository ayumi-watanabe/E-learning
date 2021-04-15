Rails.application.routes.draw do
  get 'home/top'
  get 'static_pages/new'
  get 'static_pages/index'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root  'static_pages#home'

get '/about', to: 'static_pages#about'
get '/contact', to: 'static_pages#contact'
end


