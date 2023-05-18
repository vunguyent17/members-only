Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  devise_for :users, 
  path: 'auth', 
  path_names: {
     sign_in: 'login',
     sign_out: 'logout',
     password: 'secret',
     confirmation: 'verification',
     unlock: 'unblock',
     registration: 'register',
     sign_up: 'signup' 
    },
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations' }

  resources :posts, only: %i[new create index]

  get 'profiles/:username', to: 'profiles#index', as: :show_profile
end
