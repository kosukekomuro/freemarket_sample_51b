Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products, only: [:index, :new] do
    collection do
      get 'search'
    end
  end

  resources :mypages, only: [:index] do
  end

  resources :cards, only: [:index] do
  end

  resources :users do
    collection do
      get 'login'
      get 'signup'
      get 'user_registration'
      get 'sms_confirmation'
      get 'address_registration'
      get 'card_registration'
      get 'registration_complete'
    end
  end

  resource :wizard do
    get :step1
    get :step2
    post :validate_step
  end

  resources :sessions, only: [:create, :destroy]

end
