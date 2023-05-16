Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/gyms", to: "gyms#index"
  get "/gyms/new", to: "gyms#new"
  post "/gyms", to: "gyms#create"
  get "/gyms/:id", to: "gyms#show"
  get "/gyms/:id/edit", to: "gyms#edit"
  patch "/gyms/:id", to: "gyms#update"

  get "/gyms/:id/members", to: "gym_members#index"
  get "/gyms/:id/members/new", to: "gym_members#new"
  post "/gyms/:id/members", to: "gym_members#create"

  get "/members", to: "members#index"
  get "/members/:id", to: "members#show"
  get "/members/:id/edit", to: "members#edit"
  patch "/members/:id/", to: "members#update"

end
