Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Endpoint de prueba: responde 200 solo con una API key válida.
  get "ping" => "ping#show"
  get "hola" => "hola#show"
  resources :listings, only: [:index, :show]

  # Favoritos: ver (index), agregar (create), quitar (destroy).
  resources :favorites, only: [:index, :create], param: :listing_id
  delete "favorites/:listing_id" => "favorites#destroy"

  # Defines the root path route ("/")
  # root "posts#index"
end
