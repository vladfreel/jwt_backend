Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "auth#login"
  get "/logout", to: "auth#destroy", as: "logout"
  get "/auto_login", to: "auth#auto_login"
  post "/string_calculation", to: "calc#string_calculation"
  get "/user_is_authed", to: "auth#user_is_authed"
end
