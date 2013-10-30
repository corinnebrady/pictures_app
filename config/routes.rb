PictureApp::Application.routes.draw do
  root :to => 'pages#home'
  get '/about' => 'pages#about'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # # get '/picture/:id/favourite' => 'pictures#favourite', :as => 'favourite'
  # post '/picture/:id/favourite/create' => 'pictures#favouritecreate', :as => 'new_favourites'
  # delete '/picture/:id/favourite/delete' => 'pictures#favouritedestroy', :as => 'destroy_favourites'
  # get '/picture/:id/favourites' => 'pictures#favourites', :as => 'favourites'


#  get    '/categories' => 'categories#index' categories
#  post   '/categories' => 'categories#create'
#  get    '/categories/new' => 'categories#new'      new_category
  get     '/categories/add_user_to_categories/:id/edit' => 'categories#edit_user_categories', :as => 'edit_user_to_categories'
  post     '/categories/add_user_to_categories' => 'categories#add_user_to_categories'
  get    '/categories/:id/edit' => 'categories#edit', :as => 'edit_category'
  get    '/categories/:id' => 'categories#show', :as => 'category'
  post    '/categories/:id' => 'categories#update'
  delete '/categories/:id' => 'categories#destroy'
  post    '/categories/:id' => 'categories#create'
  get    '/categories/:id/new' => 'categories#new', :as => 'new_category'

#  get '/categories' => 'categories#add_to_categories'

  resources :pictures
  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end
end
