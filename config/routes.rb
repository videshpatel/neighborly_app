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
  end
end
