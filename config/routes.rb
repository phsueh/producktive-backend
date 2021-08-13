Rails.application.routes.draw do
  # resources :tasks
  # resources :goals
  # resources :categories
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/signup", to: "users#create"
  get "/users", to: "users#index"
  get "categories", to: "categories#index"
  post "/login", to: "users#login"
  post "/createcategory", to: "categories#create"
  get "/categories", to: "categories#index"
  get "/me", to: "users#me"
  post "/creategoal", to: "goals#create"
  post "/createtask", to: "tasks#create"
  delete "/categories/:id", to: "categories#destroy"
  get "/tasks", to: "tasks#index"
  delete "/goals/:id", to: "goals#destroy"
  patch "/tasks/:id", to: "tasks#update"
end
