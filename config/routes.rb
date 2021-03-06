Tut1::Application.routes.draw do
  resources :materials

  get "errors/file_not_found"
  get "errors/unprocessable"
  get "errors/internal_server_error"
  resources :pedidos

  resources :detalle_pedidos

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

  resources :unidad_medidas

  resources :tipo_materials

  resources :historial_precio_productos

  resources :historial_costo_productos

  resources :productos

  resources :usuarios

  resources :tipo_usuarios

  resources :tipo_pagos

  resources :estado_pedidos

  resources :mesas

  devise_for :users
  get "index/home"
  get "menu/index"
  get "aux/guardar_pedido"
  get "aux/cancelar_pedido"
  get "aux/entregar_pedido"
  get "aux/finalizar_pedido"
  get "aux/guardar_compra"
  get "aux/guardar_producto"
  get "aux/cancelar_producto"
  get "aux/cancelar_inventario"
  get "aux/guardar_inventario"
  get "aux/eliminar_inventario_nuevo"
  get "aux/eliminar_inventario"
  get "mantenedores/index"
  get "carta/index"
  get "bodega/index"
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
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
