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
  get '/search_yummly' => 'recipes#search_yummly'
  get '/trending' => 'recipes#trending'
  post '/recipes/:id/add' => 'recipes#add_to_my_recipes' , :as => :add_to_my_recipes
  post '/recipes/:id/delete' => 'recipes#delete_from_my_recipes' , :as => :delete_from_my_recipes

  get '/404' => 'pages#error404' # delete me when you're done

  resources :users, :recipes, :ingredients, :cuisines, :pages 
end
