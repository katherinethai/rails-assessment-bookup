Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index', as: '/home'

  get '/books/:id/admin', to: 'books#admin'
  
  post 'favorites/new', to: 'favorites#new'
  get '/favorites', to: 'favorites#index'

  get '/users', to: 'users#index'
  get '/users/:id/view', to: 'users#view'

  post '/users/:id/make_admin', to: 'users#make_admin'
  post '/users/:id/remove_admin', to: 'users#remove_admin'

  get '/about', to: 'welcome#about'

  resources :books
end
