Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get 'user', to: 'pages#user'
end
