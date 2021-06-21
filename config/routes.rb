Rails.application.routes.draw do

  root 'sessions#welcome'
  get '/' => 'sessions#welcome'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/skills/new' => 'skills#new'

  match '/auth/github/callback' => 'sessions#omniauth', via: [:get, :post]
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :courses
  resources :skills
  resources :users do 
    resources :courses, only: [:new, :create, :index, :show, :edit, :update]
    resources :skills, only: [:new, :create, :index, :show, :edit, :update]
  end

 resources :skills do 
    resources :courses, only: [:new, :create, :index, :show, :edit, :update]
 end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
