Rails.application.routes.draw do
  devise_for :users
  resources :t_qconnections
  resources :sessions
  resources :users
  resources :tests
  resources :questions


  get '/q/:id', to: 'questions#challenge'
  get '/ss/:id', to: 'sessions#start'
  get '/sf/:id', to: 'sessions#finish'
  get '/sr/:id', to: 'sessions#reset'
  get '/sp/:id', to: 'sessions#prev'
  get '/sn/:id', to: 'sessions#next'
  get '/sc/:id', to: 'tests#challenge'
  get '/admify', to: 'users#become_admin'
  root to: 'sessions#index'


devise_scope :user do 
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
