JustlikeApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/blog' => 'pages#blog'
  get '/intro' => 'pages#intro'
  get '/dashboard' => 'pages#dashboard'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'	
  get '/search' => 'recipes#search'

  resources :users, :recipes, :ingredients, :cuisines, :pages 
end
