Rails.application.routes.draw do
  resources :tools
  resources :user_permissions

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}, :skip => [:registrations] 
  resources :users, :controller => "users" do
    collection do
      patch 'locale_switch'
      patch 'theme_switch'
      get 'lock_user'
      get 'unlock_user'
    end
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
    
  resources :external_reports

  resources :ridings do
    resources :bank_balances, only: [:new, :create]
    # member do
    #   get 'bank_balance'
    #   post 'bank_balance_update'
    # end
  end

  resources :reports, only: [:index] do
    collection do
      get :field_organizer
      get :regional_field
      get :fo_sort
    end
  end
  
  # get 'reports', to: 'reports#index'
  # e
  # get 'reports/field_organizer' do
  #   collection do
  #     
  #   end
  # end
  
  
  root "ridings#index"
end
