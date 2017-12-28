Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'dashboard#index'
  root to: 'statics#index'
end
