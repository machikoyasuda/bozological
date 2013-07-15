Bozological::Application.routes.draw do
  get "privacy" => "site#privacy"
  get "terms" => "site#terms"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "session#destroy"

  resource :session, only: [ :new, :create, :destroy]

  root 'site#index'
end
