Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      get 'patient/display'
      get 'doctor/display'

      resources :doctor
      resources :patient
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
