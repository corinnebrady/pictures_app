PictureApp::Application.routes.draw do
  root :to => 'pages#home'
  get '/about' => 'pages#about'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # get '/picture/:id/favourite' => 'pictures#favourite', :as => 'favourite'
  post '/picture/:id/favourite/create' => 'pictures#favouritecreate', :as => 'new_favourites'
  delete '/picture/:id/favourite/delete' => 'pictures#favouritedestroy', :as => 'destroy_favourites'
  get '/picture/:id/favourites' => 'pictures#favourites', :as => 'favourites'

  resources :categories
  resources :pictures
  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end
end
