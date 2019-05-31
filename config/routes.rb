Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  get "users/login" => "users#login"
  get "users/signup" => "users#signup"
  get "users/step1" => "users#step1"
  get "users/step2" => "users#step2"
  get "users/step3" => "users#step3"
  get "users/step4" => "users#step4"
  get "users/step5" => "users#step5"
  resources :products, only: [:index, :new] do
    collection do
      get 'search'
    end
  end

  resources :mypages, only: [:index] do
  end

  resources :cards, only: [:index] do
  end

end
