Rails.application.routes.draw do
  resources :announcements
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

    get :voter_contact_stats_current, to: "voter_contact_stats#current"
    get :voter_contact_stats_yesterday, to: "voter_contact_stats#yesterday"
    get :voter_contact_stats_last_7, to: "voter_contact_stats#last_7"
    get :voter_contact_stats_last_30, to: "voter_contact_stats#last_30"

    get :volunteer_stats_current, to: "volunteer_stats#current"
    get :volunteer_stats_yesterday, to: "volunteer_stats#yesterday"
    get :volunteer_stats_last_7, to: "volunteer_stats#last_7"
    get :volunteer_stats_last_30, to: "volunteer_stats#last_30"
  end

  resources :reports, only: [:index] do
    collection do
      get :field_organizer
      get :regional_field
      get :fo_sort
    end
  end
  
  resources :notifications, only: [:index, :show]
  
  
  root "ridings#index"
end
