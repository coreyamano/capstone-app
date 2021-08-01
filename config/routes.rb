Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/photos/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/ordered_items" => "ordered_items#index"

  get "/checks" => "checks#index"
end
