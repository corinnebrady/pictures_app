PictureApp::Application.routes.draw do
  root :to => 'pages#home'
  get '/about' => 'pages#about'


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :categories
  resources :pictures
  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end
end
