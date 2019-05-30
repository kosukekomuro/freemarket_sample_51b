Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"

  resources :puroducts, only: [:index, :new] do
    collection do
      get 'search'
    end
  end
end
