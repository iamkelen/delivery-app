Rails.application.routes.draw do
  resources :couriers do
    resources :packages, shallow: true
  end
  root 'couriers#index'

end
