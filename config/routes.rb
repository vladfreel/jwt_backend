Rails.application.routes.draw do
  resource :users, only: [:create]
  resources :calculations
  post "/login", to: "auth#login"
  get "/logout", to: "auth#destroy", as: "logout"
  get "/auto_login", to: "auth#auto_login"
  post "/string_calculation", to: "calc#string_calculation"
  get "/user_is_authed", to: "auth#user_is_authed"
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  put 'password/update', to: 'password#update'
end
