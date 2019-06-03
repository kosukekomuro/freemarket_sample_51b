Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products, only: [:index, :new, :show] do
    collection do
      get 'search'
      get 'buy'
    end
  end

  resource :mypages, only: [:show] do
    collection do
      get 'index'
    end
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

end
