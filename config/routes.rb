Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#index', as: '/home'

  get '/books/:id/admin', to: 'books#admin'
  
  post 'favorites/new', to: 'favorites#new'
  get '/favorites', to: 'favorites#index'
  post '/favorites/:id/delete', to: 'favorites#destroy'

  get '/users', to: 'users#index'
  get '/users/:id/view', to: 'users#view'

  get '/users/:id/make_admin', to: 'users#make_admin'
  get '/users/:id/remove_admin', to: 'users#remove_admin'

  get '/about', to: 'welcome#about'

  resources :books
end
