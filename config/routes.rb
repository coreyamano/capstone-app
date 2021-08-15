Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/ordered_items" => "ordered_items#index"
  post "/ordered_items" => "ordered_items#create"
  delete "/ordered_items" => "ordered_items#destroy"

  get "/tabs" => "tabs#index"
  post "/tabs" => "tabs#create"

  get "/checks" => "checks#index"
  post "/checks" => "checks#create"
end
