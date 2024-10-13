Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  # Página de inicio
  root "pages#home"

  # Rutas de páginas estáticas (lab2)
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "user", to: "pages#user"

  # Rutas para posts (todas las acciones)
  resources :posts do
    resources :comments, only: [ :create, :edit, :update, :destroy ]
  end
end
