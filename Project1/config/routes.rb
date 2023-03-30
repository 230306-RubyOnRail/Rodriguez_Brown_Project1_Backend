Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get :user, path: 'users', to: 'user#show'
  post :user, path: 'users', to: 'user#create'
  delete :user, path: 'users/:id', to: 'user#destroy'
  post '/login', to: 'session#create'
end
