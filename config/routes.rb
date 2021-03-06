Rails.application.routes.draw do

  resources :users, only: [:show,:new,:create,:edit,:update]

  resources :sessions, only: [:new,:create] do
    delete :destroy, on: :collection
  end

  resources :comments, only: [:destroy]

  resources :shops do
    resources :comments, only: [:create]
  end

  resources :beans do
    resources :comments, only: [:create]
  end

  resources :recipes do
    resources :comments, only: [:create]
  end

  # beans
  resources :shops, only: [] do
    resources :bean_shops, only: [:create]
  end

  # likes
  resources :beans, only: [] do
    resources :bean_likes, only: [:create,:destroy]
  end

  resources :recipes, only: [] do
    resources :recipe_likes, only: [:create,:destroy]
  end

  resources :shops, only: [] do
    resources :shop_likes, only: [:create,:destroy]
  end


  # Twitter Routes
  get "/auth/twitter", as: :sign_in_with_twitter
  get "/auth/:provider/callback" => "callbacks#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
