Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }


  root to: "pages#index"
  get "carrito", to: "pages#carrito", as: "carrito"
  get "editar", to: "pages#edit", as: "edit"
  get "menu", to: "pages#menu", as: "menu"

  namespace :dashboard do
    root to: "dashboard#index"
    resources :grupos, path: "grupos"
    resources :products, path: "productos" do
      member do
        patch :toggle_disponibilidad
      end
    end
  end
end
