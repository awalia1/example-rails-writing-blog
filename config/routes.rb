Rails.application.routes.draw do 
  root 'pages#home'

  #controller => action
  get 'register' => 'users#new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'

  resources :users
  resources :articles

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/write'=>'articles#new'
  get 'articles/edit'
  get 'articles/show'
  get 'articles/index'
  get '/search'=> 'articles#search'
  get '/results'=> 'articles#results'	
  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
