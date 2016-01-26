Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'sessions#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  get 'admin/users' => 'admin/users#index'
  get 'admin/users/:id' => 'admin/users#show', as: :admin_user_view
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:new,:create,:edit], as: :activate
  get 'admin/blockings' => 'admin/blockings#index'
  get 'admin/blockings/:category/:id' => 'admin/blockings#new', as: :admin_block
  post 'admin/blockings/:category/:id' => 'admin/blockings#create', as: :admin_block_submit
  put 'admin/blockings/:id/unblock' => 'admin/blockings#unblock', as: :admin_block_unblock
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
