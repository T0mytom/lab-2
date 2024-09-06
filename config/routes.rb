Rails.application.routes.draw do
  # Página de inicio
  root "pages#home"

  # Rutas de paginas anteriores (lab2)
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "user", to: "pages#user"

  # Rutas de post (index y show)
  resources :posts, only: [ :index, :show ]
end
