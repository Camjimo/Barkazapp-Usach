Tut1::Application.routes.draw do
  resources :equivalencia

  resources :catalogo_materials

  resources :detalle_compras

  resources :compras

  resources :tipo_contenedors

  resources :proveedors

  resources :inventario_detalles

  resources :inventarios

  resources :lotes

  resources :receta

  resources :materials

  resources :unidad_medidas

  resources :tipo_materials

  resources :historial_precio_productos

  resources :historial_costo_productos

  resources :productos

  resources :usuarios

  resources :tipo_usuarios

  resources :pedidos

  resources :tipo_pagos

  resources :estado_pedidos

  resources :mesas

  resources :categories

  resources :products

  devise_for :users
  get "index/home"
  get "menu/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
