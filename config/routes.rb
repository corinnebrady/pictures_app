PictureApp::Application.routes.draw do
  root :to => 'pages#home'
  get '/about' => 'pages#about'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/search' => 'search#search'


  get     '/categories/add_user_to_categories/:id/edit' => 'categories#edit_user_categories', :as => 'edit_user_to_categories'
  post     '/categories/add_user_to_categories' => 'categories#add_user_to_categories'
  get    '/categories/:id/edit' => 'categories#edit', :as => 'edit_category'
  get    '/categories/new' => 'categories#new', :as => 'new_category'
  post    '/categories/:id' => 'categories#create'
  get    '/categories/:id' => 'categories#show', :as => 'category'
  put    '/categories/:id' => 'categories#update'
  delete '/categories/:id' => 'categories#destroy'


  get '/picture/:id/favourite' => 'pictures#favourite', :as => 'favourite'
  delete '/picture/:id/favourite/delete' => 'pictures#destroy_favourite', :as => 'destroy_favourite'

  get '/users/:id/favourites' => 'users#favourite', :as => 'favourites'


  resources :pictures
  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end
end
