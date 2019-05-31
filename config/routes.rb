Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  get "users/login" => "users#login"
  get "users/signup" => "users#signup"
  get "users/user_registration" => "users#user_registration"
  get "users/sms_confirmation" => "users#sms_confirmation"
  get "users/address_registration" => "users#address_registration"
  get "users/scard_registration" => "users#scard_registration"
  get "users/registration_complete" => "users#registration_complete"
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
