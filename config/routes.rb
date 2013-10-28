PictureApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/about' => 'pages#about'

  resources :pictures
  resources :user, :except => [:edit] do
    collection do
      get 'edit'
    end
  end
end
