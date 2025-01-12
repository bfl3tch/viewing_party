Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/registration', to: "users#new"
  post '/registration', to: "users#create"
  get '/about', to: "welcome#show"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/friendships', to: 'friendships#create'

  resources :users, except: [:show, :new]
  resources :events, only: [:new, :create]

  get '/dashboard', to: 'dashboard#show'

  get '/discover', to: 'discovers#show'

  resources :movies, only: [:index, :show]

  resources :events

end
