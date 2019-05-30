Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  get "new", to: "products#new"
  get "search", to: "product#search"
end
