Bozological::Application.routes.draw do
  get "privacy"   => "site#privacy"
  get "terms"     => "site#terms"
  get "login"     => "sessions#new"
  post "login"    => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "logout"    => "sessions#destroy"

  resources :users

  resource :session, only: [ :new, :create, :destroy ]

  resource :password, only: [:update ]

  get "reset/:code"=> "password#edit"       #password, singular

  root 'site#index'
end
