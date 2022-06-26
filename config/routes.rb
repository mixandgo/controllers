Rails.application.routes.draw do
  resources :users, only: %i[create new show edit]
  get "/my-page/:name", to: "site#index"
  root "site#index"
end
