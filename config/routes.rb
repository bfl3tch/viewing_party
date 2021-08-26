Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/registration', to: "users#new"
  post '/login', to: 'users#login'

  resources :users, except: [:show, :new, :index] do
    resources :events
  end

  get "dashboard/:id", to: 'users#show', as: "/dashboard"
end
