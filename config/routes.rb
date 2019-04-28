Rails.application.routes.draw do
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
    post '/channels' => 'channels#create'
    patch '/channels/:id' => 'channels#update'
    delete '/channels/:id' => 'channels#destroy'

    get 'replies' => 'replies#index'
    post '/replies' => 'replies#create'
    patch '/replies/:id' => 'replies#update'
    delete '/replies/:id' => 'replies#destroy'

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end
