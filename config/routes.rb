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
  get "/ordered_items/:status" => "ordered_items#show"
  post "/ordered_items" => "ordered_items#create"
  patch "/ordered_items/:id" => "ordered_items#update"
  delete "/ordered_items/:id" => "ordered_items#destroy"

  get "/tabs" => "tabs#index"
  post "/tabs" => "tabs#create"

  get "/checks" => "checks#index"
  post "/checks" => "checks#create"
  patch "/checks/:id" => "checks#update"
  delete "/checks/:id" => "checks#destroy"

  get "/kitchen_orders" => "kitchen_orders#index"
  patch "/kitchen_orders/:id" => "kitchen_orders#update"
  post "/kitchen_orders" => "kitchen_orders#create"

  get "/kitchen_tickets" => "kitchen_tickets#index"
end
