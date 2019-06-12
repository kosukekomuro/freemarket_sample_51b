Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
    member do
      get 'buy'
      post 'pay'
    end
  end

  resources :categories, only: [:show] do
    collection do
      get 'get_category_list'
    end
  end

  resource :mypages, only: [:show] do
    collection do
      get 'index'
      get 'logout'
      get 'myconfirmation'
      get 'selling_list'
      get 'likes_list'
    end
    member do
      get 'seller_product'
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy] do
  end

  resources :users, only: [:create] do
    collection do
      get 'login'
      get 'sign_up'
      get 'user_registration'
      get 'sms_confirmation'
      get 'address_registration'
      get 'card_registration'
      get 'registration_complete'
    end
  end

  resources :sessions, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]

  get 'auth/:provider/callback', to: 'users#user_registration'
  get 'auth/failure', to: 'users#login'

end
