Rails.application.routes.draw do 
  root 'pages#home'

  resources :articles
  get '/write'=>'articles#new'
  get 'articles/edit'
  get 'articles/show'
  get 'articles/index'	
  get 'pages/home'
  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
