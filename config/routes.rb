Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :stripe do
        match "/postback" => "stripe#postback", via: :all
      end
    end
  end

  devise_for :managers, :controllers => {
    registrations: 'managers/registrations',
    :sessions => "managers/sessions",
    :passwords => 'managers/passwords',
    :confirmations => 'managers/confirmations'
  }

  authenticate :manager do
    namespace :managers do
      resources :accounts do
        resources :account_managers
        resources :account_payments
      end
      resources :managers
      resources :profile, :only => [:edit, :update]
      root :to => 'dashboards#index'
    end
  end

  root 'pages#index'
end
