Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/registration', to: "users#new"
  post '/registration', to: "users#create"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, except: [:show, :new] do
    resources :events
  end

  get '/dashboard', to: 'dashboard#show'

  get '/discover', to: 'discovers#show'
end
