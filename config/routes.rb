Rails.application.routes.draw do
  get 'appointment/index'
  root 'doctor#index'

  resources :doctor
  resources :patient
  resources :appointment
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
