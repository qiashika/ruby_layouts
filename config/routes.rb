Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'patient_info/index'
      get 'patient_info/show'
      get 'doctor/index'
      get 'doctor/show'

      resources :doctor
      resources :patient_info
      resources :appointments
    end
  end
  get 'appointment/index'
  root 'doctor#index'

  resources :doctor
  resources :patient
  resources :appointment
  resources :bill
  resources :chamber
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
