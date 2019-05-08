Rails.application.routes.draw do
  resources :channels
  resources :discussions do
    resources :replies
  end

  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get '/discussions' => 'discussions#index'
    get '/discussions/:id' => 'discussions#show'
    post '/discussions' => 'discussions#create'
    patch '/discussions/:id' => 'discussions#update'
    delete '/discussions/:id' => 'discussions#destroy'

    get 'channels' => 'channels#index'
    get '/channels/:id' => 'channels#show'    
    post '/channels' => 'channels#create'
    patch '/channels/:id' => 'channels#update'
    delete '/channels/:id' => 'channels#destroy'

    get 'replies' => 'replies#index'
    get '/replies/:id' => 'replies#show' 
    post '/replies' => 'replies#create'
    patch '/replies/:id' => 'replies#update'
    delete '/replies/:id' => 'replies#destroy'

    post "/users" => "users#create"
    get 'users' => 'users#index'
    get '/users/:id' => 'users#show' 
    post "/sessions" => "sessions#create"

    get 'events' => 'events#index'
    get '/events/:id' => 'events#show' 
    post '/events' => 'events#create'
    patch '/events/:id' => 'events#update'
    delete '/events/:id' => 'events#destroy'
  end
end
