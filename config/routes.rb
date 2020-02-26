Rails.application.routes.draw do
  resources :couriers
  root 'couriers#index'
end
